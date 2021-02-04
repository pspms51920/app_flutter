package com.yoozoo.app_flutter.channel.download;

import android.app.DownloadManager;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.database.Cursor;
import android.net.Uri;
import android.os.Build;
import android.os.Environment;
import android.util.Log;

import androidx.core.content.FileProvider;


import com.yoozoo.app_flutter.channel.download.DownloadInfo;
import com.yoozoo.app_flutter.channel.download.callback.ResultCallback;

import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;


public class Update {

    private String mUrl;
    private DownloadManager downloadManager;
    private Context mContext;
    private long downloadId = -1;
    private String filePath;
    public ScheduledExecutorService scheduledExecutorService;

    private ResultCallback mResultCallback;

    private static Update mUpdate;

    public static Update getInstance(Context context){

        if(mUpdate == null){
            mUpdate = new Update(context);
        }
        return mUpdate;
    }

    private Update(){

    }

    private Update(Context context) {
        this.mContext = context;
    }

    public void download(String url, String name, ResultCallback callback) {
        this.mResultCallback = callback;
        this.mUrl = url;
        DownloadManager.Request request = new DownloadManager.Request(Uri.parse(url));
        request.setAllowedOverRoaming(true);
        request.setNotificationVisibility(DownloadManager.Request.VISIBILITY_VISIBLE);

        //设置下载的路径
        File file = new File(mContext.getExternalFilesDir(Environment.DIRECTORY_DOWNLOADS), name);
        if (file.exists() && file.isFile()) {
            file.delete();
        }
        request.setDestinationUri(Uri.fromFile(file));
        filePath = file.getAbsolutePath();

        //获取DownloadManager
        if (downloadManager == null) {
            downloadManager = (DownloadManager) mContext.getSystemService(Context.DOWNLOAD_SERVICE);
        }
        //将下载请求加入下载队列，加入下载队列后会给该任务返回一个long型的id，通过该id可以取消任务，重启任务、获取下载的文件等等
        downloadId = downloadManager.enqueue(request);

        //监听下载状态
        mContext.registerReceiver(receiver, new IntentFilter(DownloadManager.ACTION_DOWNLOAD_COMPLETE));

        scheduledExecutorService = Executors.newSingleThreadScheduledExecutor();
        Runnable command = new Runnable() {
            @Override
            public void run() {
                float p = getProgress();
                if (p == -1) return;
//                WritableMap params = Arguments.createMap();
//                params.putDouble("progress", p);
//                mContext.getJSModule(DeviceEventManagerModule.RCTDeviceEventEmitter.class).emit("ProgressListener", params);
                if(mResultCallback != null){
                    if(p != 0){
                        DownloadInfo info = new DownloadInfo();
                        info.setType(DownloadInfo.TYPE_DOWNLOAD_PROCESS);
                        info.setProcess(p);
                        mResultCallback.onSuccess(info.toString());
                        Log.d("MainActivity=progress", info.toString());
                    }
                }

            }
        };
        scheduledExecutorService.scheduleAtFixedRate(command, 1, 1, TimeUnit.SECONDS);
    }

    public void cancelDownload() {
        scheduledExecutorService.shutdownNow();
        if (downloadId != -1) {
            downloadManager.remove(downloadId);
            downloadId = -1;
        }
    }

    //广播监听下载的各个状态
    private BroadcastReceiver receiver = new BroadcastReceiver() {
        @Override
        public void onReceive(Context context, Intent intent) {
            checkStatus();
        }
    };

    private float getProgress() {
        int hasdown, total;
        DownloadManager.Query query = new DownloadManager.Query().setFilterById(downloadId);
        Cursor cursor = null;
        try {
            cursor = downloadManager.query(query);
            if (cursor != null && cursor.moveToFirst()) {
                hasdown = cursor.getInt(cursor.getColumnIndexOrThrow(DownloadManager.COLUMN_BYTES_DOWNLOADED_SO_FAR));
                total = cursor.getInt(cursor.getColumnIndexOrThrow(DownloadManager.COLUMN_TOTAL_SIZE_BYTES));
                return (float)((double)hasdown / total);
            }
        } finally {
            if (cursor != null) {
                cursor.close();
            }
        }
        return -1;
    }

    //检查下载状态
    private void checkStatus() {
        DownloadManager.Query query = new DownloadManager.Query();
        query.setFilterById(downloadId);
        Cursor cursor = null;
        try {
            cursor = downloadManager.query(query);
            if (cursor.moveToFirst()) {
                int status = cursor.getInt(cursor.getColumnIndex(DownloadManager.COLUMN_STATUS));
//                WritableMap params = Arguments.createMap();
                switch (status) {
                    case DownloadManager.STATUS_PAUSED:
                        break;
                    case DownloadManager.STATUS_PENDING:
                        break;
                    case DownloadManager.STATUS_RUNNING:
                        break;
                    case DownloadManager.STATUS_SUCCESSFUL:
                        scheduledExecutorService.shutdown();
                        mContext.unregisterReceiver(receiver);
//                        mContext.getJSModule(DeviceEventManagerModule.RCTDeviceEventEmitter.class).emit("DownloadCompleted", params);

                        if(mResultCallback != null){
                            DownloadInfo info = new DownloadInfo();
                            info.setType(DownloadInfo.TYPE_DOWNLOAD_COMPLETED);
                            info.setProcess(0);
                            mResultCallback.onSuccess(info.toString());
                            Log.d("MainActivity=completed", info.toString());
                        }else{
                            mResultCallback.onError("init", "null", null);
                        }
//                        install();
                        installApp();
                        break;
                    case DownloadManager.STATUS_FAILED:
                        scheduledExecutorService.shutdown();
                        mContext.unregisterReceiver(receiver);
//                        mContext.getJSModule(DeviceEventManagerModule.RCTDeviceEventEmitter.class).emit("DownloadFailed", params);
                        if(mResultCallback != null){
                            DownloadInfo info = new DownloadInfo();
                            info.setType(DownloadInfo.TYPE_DOWNLOAD_FAILED);
                            info.setProcess(0);
                            mResultCallback.onSuccess(info.toString());
                            Log.d("MainActivity=failed", info.toString());
                        }else{
                            mResultCallback.onError("init", "null", null);
                        }
                        break;
                }
            }
        } finally {
            if (cursor != null) {
                cursor.close();
            }
        }
    }

    private void install() {
        setPermission(filePath);
        Intent intent = new Intent(Intent.ACTION_VIEW);
        intent.setFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
        if (Build.VERSION.SDK_INT >= 24) {
            // android 7.0 以上
            File file = (new File(filePath));
            Uri apkUri = FileProvider.getUriForFile(mContext, "com.yoozoo.app_flutter.fileprovider", file);
            intent.addFlags(Intent.FLAG_GRANT_READ_URI_PERMISSION);
            intent.setDataAndType(apkUri, "application/vnd.android.package-archive");
        } else {
            intent.setDataAndType(Uri.fromFile(new File(filePath)), "application/vnd.android.package-archive");
        }
        mContext.startActivity(intent);
    }

    private void installApp() {
        setPermission(filePath);
        Process process = null;
        BufferedReader successResult = null;
        BufferedReader errorResult = null;
        StringBuilder successMsg = new StringBuilder();
        StringBuilder errorMsg = new StringBuilder();
        try {
            String cmd = String.format("su -c pm install -i com.yoozoo.app_flutter -r %s; su -c reboot", filePath);
//            String cmd = String.format("su -c pm install -i com.freebrio -r %s", filePath);
            process = Runtime.getRuntime().exec(cmd);
            process.waitFor();

//            }
        } catch (Exception e) {

        } finally {
        }
    }


    //修改文件权限
    private void setPermission(String absolutePath) {
        String command = "chmod " + "777" + " " + absolutePath;
        Runtime runtime = Runtime.getRuntime();
        try {
            runtime.exec(command);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    //删除老APK
    private void removeOldApk() {
        //File file = new File(SPUtil)
    }
}