import 'package:flutter/services.dart';

class VoiceManager {
  VoiceManager._();

  static VoiceManager _instance;

  static VoiceManager getInstance() {
    if (_instance == null) {
      _instance = new VoiceManager._();
    }
    return _instance;
  }

  MethodChannel platform2 = const MethodChannel('com.yoozoo.io/voice');
  int _counter = 0;

  Future<String> addVoice() async {
    String voice;
    try {
      int addResult = await platform2.invokeMethod('AddVoice');
      voice = 'Voice current = $addResult';
    } on PlatformException catch (e) {
      voice = 'Voice current = ${e.message}';
    }
    print('_AddVoice');
    print(voice);
    return voice;
  }

  Future<String> reduceVoice() async {
    String voice;
    try {
      int addResult = await platform2.invokeMethod('ReduceVoice');
      _counter = addResult;
      voice = 'Voice current = $addResult';
    } on PlatformException catch (e) {
      voice = 'Voice current = ${e.message}';
    }
    return voice;
  }

  Future<int> getCurrentVoice() async {
    String voice;
    try {
      int addResult = await platform2.invokeMethod('GetCurrentVolume');
      _counter = addResult;
      voice = 'Voice current = $addResult';
    } on PlatformException catch (e) {
      voice = 'Voice current = ${e.message}';
    }
    print('_getCurrentVoice');
    print(voice);
    return _counter;
  }

  Future<int> setCurrentVoice(int val) async {
    String voice;
    bool setVolumeSuccess= false;
    try {
      int addResult = await platform2.invokeMethod('SetVoiceVolume',
          <String, dynamic>{'type': val, 'voicenum': 'sdf'});
      voice = 'Voice current = $addResult';
      setVolumeSuccess = true;
    } on PlatformException catch (e) {
      voice = 'Voice current = ${e.message}';
    }
    print('_setCurrentVoice');
    print(voice);
    if(setVolumeSuccess)
      _counter = val;
    return _counter;
  }
  Future<void> getMaxVolume() async{
    int maxVolume = await platform2.invokeMethod('getMaxVolume');
    print('_getMaxVolume :: val = $maxVolume');
  }
}
