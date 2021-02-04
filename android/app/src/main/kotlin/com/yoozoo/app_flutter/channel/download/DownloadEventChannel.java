package com.yoozoo.app_flutter.channel.download;

import android.util.Log;

import org.greenrobot.eventbus.EventBus;

import io.flutter.plugin.common.BinaryMessenger;
import io.flutter.plugin.common.EventChannel;
import io.flutter.view.FlutterView;

public class DownloadEventChannel implements EventChannel.StreamHandler {

    private static final String TAG = "DownloadEventChannel";
    private static final String EVENT_CHANNEL_NAME = "com.yoozoo.io/event_download";

    private DownloadEventChannel(BinaryMessenger messenger) {
        EventChannel eventChannel = new EventChannel(messenger, EVENT_CHANNEL_NAME);
        eventChannel.setStreamHandler(this);
        EventBus.getDefault().register(this);
    }

    public static DownloadEventChannel create(BinaryMessenger messenger) {
        return new DownloadEventChannel(messenger);
    }

    private static EventChannel.EventSink eventSink;

//    /**
//     * 暴露出去供界面传数据到Flutter
//     */
//    public void sendEvent(Object data) {
//        if (eventSink != null) {
//            eventSink.success(data);
//        } else {
//            Log.e(TAG, "===== DownloadEventChannel.eventSink 为空 需要检查一下 =====");
//        }
//    }

    @Override
    public void onListen(Object o, EventChannel.EventSink eventSink) {
        this.eventSink = eventSink;
        Log.e(TAG, "===== DownloadEventChannel.onListen =====");
    }

    @Override
    public void onCancel(Object o) {
        eventSink = null;
        Log.e(TAG, "===== DownloadEventChannel.onCancel =====");
        EventBus.getDefault().unregister(this);
    }

//    @Subscribe(threadMode = ThreadMode.MAIN)
//    public void onMessageEvent(MessageEvent event) {
//        if(event.getType() == MessageEvent.TYPE_DOWNLOAD_PROCESS) {
//            Log.d("DownloadEventChannel", "TYPE_DOWNLOAD_PROCESS");
//            String json = (String) event.getMsg();
//            if(eventSink != null){
//                eventSink.success(json);
//                Log.d("DownloadEventChannel", "eventSink.success(json)");
//            }else {
//                Log.d("DownloadEventChannel", "eventSink = null");
//            }
//
//        }
//    }
}
