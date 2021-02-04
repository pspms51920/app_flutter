package com.yoozoo.app_flutter.channel.system;

import android.content.ActivityNotFoundException;
import android.content.ComponentName;
import android.content.Context;
import android.content.ContextWrapper;
import android.content.Intent;
import android.content.IntentFilter;
import android.os.BatteryManager;
import android.os.Build;
import android.provider.Settings;
import android.util.Log;

import static android.content.Context.BATTERY_SERVICE;

public class SystemManager {
    private final String TAG = "SystemManager";
    private Context mContext;
    private static SystemManager mSystemManager;

    private static SystemManager getInstance(Context context){
        if(mSystemManager == null){
            mSystemManager = new SystemManager(context);
        }
        return mSystemManager;
    }

    public SystemManager(Context context){
        this.mContext = context;
//        mSystemManager = new SystemManager(context);
    }

    public int getBatteryLevel() {
        int batteryLevel = -1;
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {
            BatteryManager batteryManager = (BatteryManager) mContext.getSystemService(BATTERY_SERVICE);
            batteryLevel = batteryManager.getIntProperty(BatteryManager.BATTERY_PROPERTY_CAPACITY);
        } else {
            Intent intent = new ContextWrapper(mContext.getApplicationContext()).
                    registerReceiver(null, new IntentFilter(Intent.ACTION_BATTERY_CHANGED));
            batteryLevel = (intent.getIntExtra(BatteryManager.EXTRA_LEVEL, -1) * 100) /
                    intent.getIntExtra(BatteryManager.EXTRA_SCALE, -1);
        }
        return batteryLevel;
    }

    /**
     * 通过Runtime，发送指令，重启系统，测试结果，不起作用，可能需要root
     */
    public int reBoot2() {
        try {
            Log.v(TAG, "root Runtime->reboot");
            Process proc = Runtime.getRuntime().exec("reboot");
            proc.waitFor();
            return 0;
        } catch (Exception ex) {
            ex.printStackTrace();
            return -1;
        }
    }

    public void openSystemWifi(){
        Intent it = new Intent(Settings.ACTION_WIFI_SETTINGS);
        it.putExtra("extra_prefs_show_button_bar", true);//是否显示button bar
        it.putExtra("extra_prefs_set_back_text", "完成");
        it.putExtra("extra_prefs_set_next_text", "返回");
        //it.putExtra("wifi_enable_next_on_connect", true);
        mContext.startActivity(it);
    }

    public void openSystemWifi2(){
//        //注意是这个：WifiManager.ACTION_PICK_WIFI_NETWORK
//        Intent intent = new Intent(WifiManager.ACTION_PICK_WIFI_NETWORK);
//        intent.putExtra("only_access_points", true);
//        intent.putExtra("extra_prefs_show_button_bar", true);
//        intent.putExtra("wifi_enable_next_on_connect", true);
//        mContext.startActivity(intent);
////        startActivityForResult(intent, 1);
        Intent intent = new Intent();
        intent.setAction("android.net.wifi.PICK_WIFI_NETWORK");
        intent.putExtra(":settings:show_fragment_as_subsetting", true);
        mContext.startActivity(intent);
    }

    public void openSystemBluetooth(){
        Intent intent = new Intent(Settings.ACTION_BLUETOOTH_SETTINGS);
        intent.putExtra("extra_prefs_show_button_bar", true);//是否显示button bar
        intent.putExtra("extra_prefs_set_back_text", "完成");
        intent.putExtra("extra_prefs_set_next_text", "返回");
        mContext.startActivity(intent);
    }

    public void openDeleveop(){
        Intent intent = new Intent(Settings.ACTION_APPLICATION_DEVELOPMENT_SETTINGS);
        intent.putExtra(":settings:show_fragment_as_subsetting", true);
        mContext.startActivity(intent);
    }

    public void openSystemBluetooth3(){
        Intent intent = new Intent(Settings.ACTION_BLUETOOTH_SETTINGS);
        intent.putExtra(":settings:show_fragment_as_subsetting", true);
        mContext.startActivity(intent);
    }


    public void openSystemBluetooth2(){
        startActivityAsSubSetting("com.android.settings",
                "com.android.settings.Settings$BluetoothSettingsActivity");
    }

    public static final String EXTRA_SHOW_FRAGMENT_AS_SUBSETTING =
            ":settings:show_fragment_as_subsetting";
        private void startActivityAsSubSetting(String pkg, String cls) {
            Intent intent = new Intent();
            intent.setComponent(new ComponentName(pkg, cls));
            intent.setFlags(Intent.FLAG_ACTIVITY_CLEAR_TASK);
            intent.putExtra(EXTRA_SHOW_FRAGMENT_AS_SUBSETTING, true);
            try {
                mContext.startActivity(intent);
            } catch (ActivityNotFoundException ex) {
                ex.printStackTrace();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }


}
