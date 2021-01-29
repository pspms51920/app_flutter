import 'dart:convert';
import 'dart:io';

import 'package:app_flutter/basic/api/dio_util.dart';
import 'package:app_flutter/basic/api/request_response.dart';
import 'package:app_flutter/basic/configs/app.core.dart';
import 'package:app_flutter/basic/configs/constant.dart';
import 'package:app_flutter/basic/util/log_util.dart';
import 'package:device_info/device_info.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:package_info/package_info.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// @description 配置信息


const bool dev = !kReleaseMode;//是否是开发者模式
const bool log = !kReleaseMode;//是否配置log
const bool proxy = false;//是否代理
_parseAndDecode(String response) {
  return jsonDecode(response);
}

parseJson(String text) {
  return compute(_parseAndDecode, text);
}

class Config {
  Config._();

  static Config _instance;

  static Config getInstance() {
    if (_instance == null) {
      _instance = Config._();
    }
    return _instance;
  }

  void loadInt() {
    LogUtil.init(isDebug: log, title: 'cloudgame Log');
    _initStatusBar();
    _initHttpConfig();
    _initDeviceInfo();
    _initAppInfo();

  }

  ///沉浸式状态啦
  ///全屏显示
  void _initStatusBar() {
    if (Platform.isAndroid) {
      SystemUiOverlayStyle systemUiOverlayStyle =
          SystemUiOverlayStyle(statusBarColor: Colors.transparent);
      SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
      SystemChrome.setEnabledSystemUIOverlays([]);
    }
  }

  ///初始化网络配置
  void _initHttpConfig() {
    // 设置代理，方便测试抓数据
    if(proxy){
      (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate = (client) {
        client.findProxy = (Uri) {
          return  'PROXY 192.168.1.141:8888' ;//小燕的本机地址
        };
      };
    }
    if(!log){
      dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));
    }
    dio.interceptors
      ..add(RequestResponseInterceptor());
    (dio.transformer as DefaultTransformer).jsonDecodeCallback = parseJson;
    dio.options
      ..baseUrl = URL_BASE
      ..connectTimeout = 10000
      ..receiveTimeout = 15000
      ..contentType = ContentType.parse("application/json")
      ..responseType = ResponseType.plain;
  }

  ///初始化设备信息
  void _initDeviceInfo() async {
//    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
//    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;

    // String serialNumber = await SystemManager.getInstance().getSerialNumber();
    // print('======设备 serialNumber : $serialNumber');
    // AppCore.getInstance()..xDeviceNumber = serialNumber;
  }

  ///初始化app信息
  void _initAppInfo() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    AppCore.getInstance().xClientVersion = packageInfo.version;
  }


}
