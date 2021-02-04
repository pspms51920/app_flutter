package com.yoozoo.app_flutter;

import android.content.Context;

import androidx.annotation.CallSuper;

import io.flutter.app.FlutterApplication;


public class MainApplication extends FlutterApplication {
    private boolean logAble = false;

    @CallSuper
    public void onCreate() {
        super.onCreate();
        instance = this;
    }



    private static MainApplication instance;

    public static MainApplication getInstance() {
        return instance;
    }

    public boolean isLogAble() {
        return logAble;
    }

    public void setLogAble(boolean logAble) {
        this.logAble = logAble;
    }
}
