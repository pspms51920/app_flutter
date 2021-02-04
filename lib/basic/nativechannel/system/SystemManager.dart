import 'package:flutter/services.dart';

class SystemManager {
  SystemManager._();

  static SystemManager _instance;

  static SystemManager getInstance() {
    if (_instance == null) {
      _instance = new SystemManager._();
    }
    return _instance;
  }

  MethodChannel platform3 = const MethodChannel('com.yoozoo.io/system');

  Future<String> getBatteryLevel() async {
    String batteryLevel;
    try {
      final int result = await platform3.invokeMethod('getBatteryLevel');
      batteryLevel = 'Battery level at $result % .';
    } on PlatformException catch (e) {
      batteryLevel = "Failed to get battery level: '${e.message}'.";
    }
    return batteryLevel;
  }

  String rebootCode="-2";
  Future<String> reBoot() async{
    String voice;
    try{
      int addResult = await platform3.invokeMethod('reBoot');
      voice = '_reBoot current = $addResult';
    } on PlatformException catch(e){
      voice = '_reBoot current = ${e.message}';
    }
    return voice;
  }

  Future<void> openSystemWifi() async {
    try {
      final int result = await platform3.invokeMethod('openSystemWifi');
    } on PlatformException catch (e) {
      print('${e.message}');
    }
  }

  Future<void> openSystemBluetooth() async {
    try {
      final int result = await platform3.invokeMethod('openSystemBluetooth');
    } on PlatformException catch (e) {
      print('${e.message}');
    }
  }

  Future<void> showSystemFloat(bool visible) async {
    try {
      final int result = await platform3.invokeMethod('showSystemFloat',
          <String, dynamic>{
            "visible":visible
          });
    } on PlatformException catch (e) {
      print('${e.message}');
    }
  }
  Future<String> getSerialNumber() async{
    String serialNumber = '';
    try{
      serialNumber = await platform3.invokeMethod('getSerialNumber');
    } on PlatformException catch(e){
    }
    return serialNumber;
  }
  Future<String> getAvailMemory() async{
    String availMemory = '';
    try{
      availMemory = await platform3.invokeMethod('getAvailMemory');
    } on PlatformException catch(e){
    }
    return availMemory;
  }
  Future<String> getTotalMemory() async{
    String totalMemory = '';
    try{
      totalMemory = await platform3.invokeMethod('getTotalMemory');
    } on PlatformException catch(e){
    }
    return totalMemory;
  }
  Future<double> getCpuUsed() async{
    double cpuUsed = 0.0;
    try{
      cpuUsed = await platform3.invokeMethod('getCpuUsed');
    } on PlatformException catch(e){
    }
    return cpuUsed;
  }
  Future<String> getCpuTemp() async{
    String cpuUsed = '';
    try{
      cpuUsed = await platform3.invokeMethod('getCpuTemp');
    } on PlatformException catch(e){
    }
    return cpuUsed;
  }
  Future<void> setLogAble(bool logAble) async{
    try {
      await platform3.invokeMethod('log',
          <String, dynamic>{
            "logAble":logAble
          });
    } on PlatformException catch (e) {
      print('${e.message}');
    }
  }
}
