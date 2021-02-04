package com.yoozoo.app_flutter.channel.download;

import android.content.Context;
import android.os.Environment;
import android.util.Log;

import com.yoozoo.app_flutter.channel.download.callback.ResultCallback;
import com.yoozoo.app_flutter.utils.eventbus.MessageEvent;

import org.greenrobot.eventbus.EventBus;

import io.flutter.plugin.common.BinaryMessenger;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.view.FlutterView;

/**
 * 构造网络通信渠道
 */
public class DownloadMethodChannel implements MethodChannel.MethodCallHandler {
    private static final String TAG = "DownloadMethodChannel";

    private static final String DOWNLOAD_CHANNEL = "com.yoozoo.io/download";

    private MethodChannel mChannel;
    private Context context;
//    private DownloadEventChannel eventChannel;

    private DownloadMethodChannel(Context context, BinaryMessenger messenger) {
        this.context = context;
        mChannel = new MethodChannel(messenger, DOWNLOAD_CHANNEL);
        mChannel.setMethodCallHandler(this);
//        eventChannel = DownloadEventChannel.create(flutterView);
    }

    /**
     * 暴露到外面的静态create类
     */
    public static DownloadMethodChannel create(Context context, BinaryMessenger messenger) {
        return new DownloadMethodChannel(context, messenger);
    }

    @Override
    public void onMethodCall(MethodCall call, MethodChannel.Result result) {
        if(call.method.equals("downloadapk")){
            String url = null;
            if(call.hasArgument("url")){
                url = call.argument("url");
                Log.i(TAG, "下载url：" + call.argument("url"));
            }
            Update.getInstance(context).download(url, "app.apk", new ResultCallback() {
                @Override
                public void onSuccess(Object json) {
                    Log.i(TAG, "callback::" + json);
//                    eventChannel.sendEvent(object);
                    EventBus.getDefault().post(new MessageEvent(MessageEvent.TYPE_DOWNLOAD_PROCESS, json.toString()));
                    Log.i(TAG, "callback::后面" + json);
                }

                @Override
                public void onError(String var1, String var2, Object var3) {
//                    eventChannel.sendEvent(var3);
                }
            });
        }else if(call.method.equals("downloadcancel")){
            try{
                Update.getInstance(context).cancelDownload();
            }catch (Exception e){
                e.printStackTrace();
            }

        }else{
            result.notImplemented();
        }

    }

}