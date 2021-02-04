import 'package:flutter/services.dart';

class UpdateManager {
  UpdateManager._();

  static UpdateManager _instance;

  static UpdateManager getInstance() {
    if (_instance == null) {
      _instance = new UpdateManager._();
    }
    return _instance;
  }

  MethodChannel platform = const MethodChannel('com.yoozoo.io/update');


  Future<String> getCurrentApkAddress() async{
    String voice;
    try{
      int addResult = await platform.invokeMethod('getCurrentApkAddress');
      voice = 'getCurrentApkAddress current = $addResult';
    } on PlatformException catch(e){
      voice = 'getCurrentApkAddress current = ${e.message}';
    }
    return voice;
  }

  Future<String> getVersion() async{
    String voice;
    try{
      int addResult = await platform.invokeMethod('getVersion');
      voice = 'getVersion current = $addResult';
    } on PlatformException catch(e){
      voice = 'getVersion current = ${e.message}';
    }
    return voice;
  }

  Future<String> getRunInfo() async{
    String voice;
    try{
      Map<String, double> addResult = await platform.invokeMethod('getRunInfo');
      voice = 'getRunInfo current = $addResult';
    } on PlatformException catch(e){
      voice = 'getRunInfo current = ${e.message}';
    }
    return voice;
  }

  Future<String> rebootDevice() async{
    String voice;
    try{
      int addResult = await platform.invokeMethod('rebootDevice');
      voice = 'rebootDevice current = $addResult';
    } on PlatformException catch(e){
      voice = 'rebootDevice current = ${e.message}';
    }
    return voice;
  }

  Future<String> initLogExtraInfo(String comName, String deviceName) async{
    String voice;
    try{
      String addResult = await platform.invokeMethod('initLogExtraInfo',
          <String, dynamic>{
            "comName":comName,
            "deviceName":deviceName
          }
      );
      voice = 'initLogExtraInfo current = $addResult';
    } on PlatformException catch(e){
      voice = 'initLogExtraInfo current = ${e.message}';
    }
    print('initLogExtraInfo');
    print(voice);
    return voice;
  }

  Future<String> backAppSystem() async{
    String voice;
    try{
      int addResult = await platform.invokeMethod('backAppSystem');
      voice = 'backAppSystem current = $addResult';
    } on PlatformException catch(e){
      voice = 'backAppSystem current = ${e.message}';
    }
    return voice;
  }

}
