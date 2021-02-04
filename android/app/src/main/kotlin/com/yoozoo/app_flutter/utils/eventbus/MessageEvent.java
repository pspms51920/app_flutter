package com.yoozoo.app_flutter.utils.eventbus;

import android.util.Log;

public class MessageEvent {
    public static final int TYPE_SDCARD_EXCEPTION = 1;
    public static final int TYPE_SYSTEM_FLOAT_STATUS = 2;

    public static final int TYPE_DOWNLOAD_PROCESS = 4;

    private static final String TAG = "AA";
    private int type;
    private Object msg;

    public MessageEvent(int type, Object msg) {
        this.type = type;
        this.msg = msg;
        Log.i(TAG, "MessageEvent: " + type + msg);
    }

    public int getType(){
        return type;
    }

    public Object getMsg() {
        return msg;
    }

    public void setMsg(Object msg) {
        this.msg = msg;
    }
}
