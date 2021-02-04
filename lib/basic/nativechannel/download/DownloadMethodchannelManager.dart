import 'package:flutter/services.dart';

class DownloadMethodchannelManager {
  DownloadMethodchannelManager._();

  static DownloadMethodchannelManager _instance;

  static DownloadMethodchannelManager getInstance() {
    if (_instance == null) {
      _instance = new DownloadMethodchannelManager._();
    }
    return _instance;
  }

  MethodChannel platform4 = const MethodChannel('com.yoozoo.io/download');

  Future<String> downloadApk(String loadurl) async{
    String voice;
    try{
      String addResult = await platform4.invokeMethod('downloadapk',
          <String, dynamic>{
            "url":loadurl
          }
      );
      voice = 'downloadApk current = $addResult';
    } on PlatformException catch(e){
      voice = 'downloadApk current = ${e.message}';
    }
    print('_downloadApk');
    print(voice);
    return voice;
  }

  Future<String> cancelDownload() async{
    String info ;
    try{
      info = await platform4.invokeMethod('downloadcancel');
    }on PlatformException catch(e){
      info = 'downloadcancel = ${e.message}';
    }
    print('_cancelDownload');
    print(info);
    return info;
  }

  Future<String> okDownload() async{
    print('okDownload');
    String info ;
    try{
      info = await platform4.invokeMethod('okDownload');
    }on PlatformException catch(e){
      info = 'okDownload = ${e.message}';
    }
    print('okDownload');
    print(info);
    return info;
  }
  Future<String> okDownloadCancel() async{
    String info ;
    try{
      info = await platform4.invokeMethod('okDownloadCancel');
    }on PlatformException catch(e){
      info = 'okDownloadCancel = ${e.message}';
    }
    print('okDownloadCancel');
    print(info);
    return info;
  }
}
