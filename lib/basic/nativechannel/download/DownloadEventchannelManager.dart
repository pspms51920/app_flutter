import 'package:flutter/services.dart';

class DownloadEventchannelManager {
  DownloadEventchannelManager._();

  static DownloadEventchannelManager _instance;

  static DownloadEventchannelManager getInstance() {
    if (_instance == null) {
      _instance = new DownloadEventchannelManager._();
    }
    return _instance;
  }

  static const EventChannel eventChannel =
      const EventChannel('com.yoozoo.io/event_download');
  DownloadStatusListener _onStatusChangeListener;

  receiveBroadcastStream(DownloadStatusListener listener) {
    _onStatusChangeListener = listener;
    eventChannel.receiveBroadcastStream().listen(_onEvent, onError: _onError);
  }

  removeBroadcastStream(){
    _onStatusChangeListener = null;
  }
  void _onEvent(Object event) {
    print('_onStatusChangeListener===${event.toString()}');
    if (_onStatusChangeListener != null) {
      _onStatusChangeListener.onDownloadSuccess(event);
    }else{
      print('_onStatusChangeListener = null');
    }
  }

  void _onError(Object error) {
    if (_onStatusChangeListener != null) {
      _onStatusChangeListener.onDownloadFailure(error);
    }
  }
}

//定义一个抽象类
abstract class DownloadStatusListener {
  void onDownloadSuccess(Object obj);

  void onDownloadFailure(Object obj);
}
