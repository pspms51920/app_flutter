package com.yoozoo.app_flutter.channel.voice;

import android.content.Context;
import android.util.Log;

import io.flutter.plugin.common.BinaryMessenger;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.view.FlutterView;

public class VoiceMethodChannel implements MethodChannel.MethodCallHandler{
    private static final String TAG = "VoiceMethodChannel";
    private static String VOICE_CHANNEL = "com.yoozoo.io/voice";
    private MethodChannel methodChannel;
    private VoiceManager mVoiceManager;

    private VoiceMethodChannel(Context context, BinaryMessenger messenger){
        methodChannel = new MethodChannel(messenger, VOICE_CHANNEL);
        methodChannel.setMethodCallHandler(this);
        mVoiceManager = VoiceManager.getInstance(context);
    }

    public static VoiceMethodChannel create(Context context, BinaryMessenger messenger){
        return new VoiceMethodChannel(context, messenger);
    }

    @Override
    public void onMethodCall(MethodCall call, MethodChannel.Result result) {
        if(call.method.equals("AddVoice")){
            int voiceNum = mVoiceManager.up();
            if(voiceNum >=0){
                result.success(voiceNum);
            }else{
                result.error("addfailure", "addfailuree", null);
            }
        }else if(call.method.equals("ReduceVoice")){
            int voiceNum = mVoiceManager.down();
            if(voiceNum >=0){
                result.success(voiceNum);
            }else{
                result.error("reducefailure", "reducefailuree", null);
            }
        }else if(call.method.equals("GetCurrentVolume")){
            int voiceNum = mVoiceManager.getCurrentVolume();
            if(voiceNum >=0){
                result.success(voiceNum);
            }else{
                result.error("currentfailure", "currentfailuree", null);
            }
        }else if(call.method.equals("SetVoiceVolume")){
            int type = 0;
            String numnum;
            if(call.hasArgument("type")){
                type = call.argument("type");
                Log.i(TAG, "音量type：" + call.argument("type"));
            }
            if(call.hasArgument("voicenum")){
                numnum = call.argument("voicenum");
            }
            int voiceNum = mVoiceManager.setVoiceCurrent(type);
            if(voiceNum >=0){
                result.success(voiceNum);
            }else{
                result.error("setfailure", "setfailuree", null);
            }
        }else if(call.method.equals("getMaxVolume")){
            int maxVoiceNum = mVoiceManager.getMaxVolume();
            Log.i(TAG, "最大音量：" + maxVoiceNum);
            result.success(maxVoiceNum);
        }

    }
}
