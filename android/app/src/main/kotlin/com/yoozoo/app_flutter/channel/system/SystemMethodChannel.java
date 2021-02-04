package com.yoozoo.app_flutter.channel.system;

import android.content.Context;
import android.os.Build;

import com.yoozoo.app_flutter.MainApplication;
import com.yoozoo.app_flutter.utils.SystemUtil;
import com.yoozoo.app_flutter.utils.eventbus.MessageEvent;

import org.greenrobot.eventbus.EventBus;

import io.flutter.plugin.common.BinaryMessenger;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.view.FlutterView;

/**
 * 构造网络通信渠道
 * Created by wuminjian on 2018/12/13.
 */
public class SystemMethodChannel implements MethodChannel.MethodCallHandler {
    private static final String TAG = "SystemMethodChannel";

    private static final String HTTP_CHANNEL = "com.yoozoo.io/system";

    private MethodChannel mChannel;
    private Context context;
    private SystemManager mSystemManager;

    private SystemMethodChannel(Context context, BinaryMessenger messenger) {
        this.context = context;
        mChannel = new MethodChannel(messenger, HTTP_CHANNEL);
        mChannel.setMethodCallHandler(this);
        mSystemManager = new SystemManager(context);
    }

    /**
     * 暴露到外面的静态create类
     */
    public static SystemMethodChannel create(Context context, BinaryMessenger messenger) {
        return new SystemMethodChannel(context, messenger);
    }

    @Override
    public void onMethodCall(MethodCall call, MethodChannel.Result result) {
        if (call.method.equals("getBatteryLevel")) {
            int batteryLevel = mSystemManager.getBatteryLevel();
            if (batteryLevel != -1) {
                result.success(batteryLevel);
            } else {
                result.error("UNAVAILABLE", "Battery level not available.", null);
            }
        } else if (call.method.equals("reBoot")) {
            int code = mSystemManager.reBoot2();
            result.success(code);
        } else if (call.method.equals("openSystemWifi")) {
            mSystemManager.openSystemWifi2();
        } else if(call.method.equals("openSystemBluetooth")){
            mSystemManager.openSystemBluetooth();
        } else if (call.method.equals("showSystemFloat")) {
            if (call.hasArgument("visible")) {
                boolean statu = call.argument("visible");
                EventBus.getDefault().post(new MessageEvent(MessageEvent.TYPE_SYSTEM_FLOAT_STATUS, statu));
            }
        } else if(call.method.equals("getSerialNumber")){
            result.success(Build.SERIAL);
        } else if(call.method.equals("getAvailMemory")){
            result.success(SystemUtil.getAvailMemory());
        } else if(call.method.equals("getTotalMemory")){
            result.success(SystemUtil.getTotalMemory());
        } else if(call.method.equals("getCpuUsed")){
            result.success(SystemUtil.getCpuUsed());
        } else if(call.method.equals("getCpuTemp")){
            result.success(SystemUtil.getCpuTemp());
        } else if(call.method.equals("log")){
            if (call.hasArgument("logAble")) {
                boolean logAble = call.argument("logAble");
                MainApplication.getInstance().setLogAble(logAble);
            }
        } else {
            result.notImplemented();
        }

    }

}