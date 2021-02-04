package com.yoozoo.app_flutter.channel.voice;

import android.content.Context;
import android.media.AudioManager;
import android.util.Log;

import static android.content.Context.AUDIO_SERVICE;


public class VoiceManager {
    private final String TAG = "VoiceManager";
    private AudioManager mAudioManager;
    private int maxVolume;
    private int currentVolume;

    private static VoiceManager mVoiceManager;

    public static VoiceManager getInstance(Context context){
        if(mVoiceManager == null){
            mVoiceManager = new VoiceManager(context);
        }
        return mVoiceManager;
    }

    private VoiceManager(Context context){
        mAudioManager = (AudioManager) context.getSystemService(AUDIO_SERVICE);
    }

    public int getMaxVolume(){
        // 最大音量
        maxVolume = mAudioManager
                .getStreamMaxVolume(AudioManager.STREAM_MUSIC);
        Log.i(TAG, "最大音量：" + maxVolume);
        return maxVolume;
    }

    public int getCurrentVolume(){
        currentVolume = mAudioManager
                .getStreamVolume(AudioManager.STREAM_MUSIC);
        Log.i(TAG, "当前音量：" + currentVolume);
        return currentVolume;
    }


    public int up() {
        // 音量增大
        // AudioManager.STREAM_SYSTEM
        mAudioManager.adjustStreamVolume(AudioManager.STREAM_MUSIC,
                AudioManager.ADJUST_RAISE, AudioManager.FLAG_REMOVE_SOUND_AND_VIBRATE);
        return getCurrentVolume();
    }

    public int down() {
        // 音量减小
        mAudioManager.adjustStreamVolume(AudioManager.STREAM_MUSIC,
                AudioManager.ADJUST_LOWER, AudioManager.FLAG_REMOVE_SOUND_AND_VIBRATE);
        return getCurrentVolume();
    }


    public int setVoiceCurrent(int index){
        //设置音量
        mAudioManager.setStreamVolume(AudioManager.STREAM_MUSIC, index, AudioManager.FLAG_REMOVE_SOUND_AND_VIBRATE);
        return getCurrentVolume();
    }

}
