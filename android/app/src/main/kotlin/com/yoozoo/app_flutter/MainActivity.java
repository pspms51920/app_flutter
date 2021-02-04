package com.yoozoo.app_flutter;

import android.os.Bundle;
import android.util.Log;
import android.widget.Toast;

import com.yoozoo.app_flutter.channel.download.DownloadMethodChannel;
import com.yoozoo.app_flutter.channel.download.Update;
import com.yoozoo.app_flutter.channel.system.SystemMethodChannel;
import com.yoozoo.app_flutter.channel.voice.VoiceMethodChannel;
import com.yoozoo.app_flutter.utils.eventbus.MessageEvent;
import io.flutter.embedding.android.FlutterActivity;
import androidx.annotation.NonNull;
import org.greenrobot.eventbus.EventBus;
import org.greenrobot.eventbus.Subscribe;
import org.greenrobot.eventbus.ThreadMode;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.plugin.common.EventChannel;
import io.flutter.plugins.GeneratedPluginRegistrant;


public class MainActivity extends FlutterActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        //注册EventBus
        EventBus.getDefault().register(this);
    }


    @Override
    public void configureFlutterEngine(@NonNull FlutterEngine flutterEngine) {
        GeneratedPluginRegistrant.registerWith(flutterEngine);

        SystemMethodChannel.create(MainActivity.this, flutterEngine.getDartExecutor().getBinaryMessenger());
        VoiceMethodChannel.create(MainActivity.this, flutterEngine.getDartExecutor().getBinaryMessenger());
        DownloadMethodChannel.create(MainActivity.this, flutterEngine.getDartExecutor().getBinaryMessenger());
        initUpdateEventChannel(flutterEngine);


//        new MethodChannel(flutterEngine.getDartExecutor().getBinaryMessenger(), CHANNEL)
//                .setMethodCallHandler(
//                        (call, result) -> {
//                            // Your existing code
//                        }
//        );
    }


    private EventChannel.EventSink mUpdateEventSink;
    private void initUpdateEventChannel(FlutterEngine flutterEngine){
        new EventChannel(flutterEngine.getDartExecutor().getBinaryMessenger(),"com.yoozoo.io/event_download").setStreamHandler(new EventChannel.StreamHandler() {
            @Override
            public void onListen(Object o, EventChannel.EventSink eventSink) {
//              eventSink.success("hello world !");
                mUpdateEventSink = eventSink;
                Log.e("MainActivity", "===== FlutterEventChannel.onListen =====");
            }

            @Override
            public void onCancel(Object o) {
                Log.e("MainActivity", "===== FlutterEventChannel.onCancel =====");
            }
        });
    }

    @Override
    protected void onDestroy() {
        super.onDestroy();
        Log.d("MainActivity", "===== onDestroy =====");
        Update.getInstance(MainActivity.this).cancelDownload();
        //注销EventBus
        EventBus.getDefault().unregister(this);
    }

    @Subscribe(threadMode = ThreadMode.MAIN)
    public void onMessageEvent(MessageEvent event) {
        /* Do something */
        if(event.getType() == MessageEvent.TYPE_DOWNLOAD_PROCESS) {
            Log.d("DownloadEventChannel", "TYPE_DOWNLOAD_PROCESS");
            String json = (String) event.getMsg();
            if(mUpdateEventSink != null){
                mUpdateEventSink.success(json);
                Log.d("DownloadEventChannel", "eventSink.success(json)");
            }else {
                Log.d("DownloadEventChannel", "eventSink = null");
            }
        }
    }
}
