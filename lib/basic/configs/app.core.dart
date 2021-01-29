import 'package:app_flutter/basic/model/user_login_result_entity.dart';
import 'package:flutter/material.dart';

/// @description


class AppCore{
  AppCore._();
  static AppCore _instance;
  static AppCore getInstance(){
    if(_instance == null){
      _instance = AppCore._();
    }
    return _instance;
  }

  String userToken = "";

  ///设备和app信息
  String xDeviceNumber ;//设备id
  String xClientVersion ; //app版本号
  String shopLoginName = ''; //商户登录名
  String wifiName = '';//WIFI

  ///商户信息
  // ShopInfoEntity shopInfo;
  String deviceType;//设备类型 (SHOP，PERSOPN)

  //用户信息(登录)
  UserLoginResultEntity userLoginResultEntity;
  bool comLogin = false;
  String sdt = "";//商户token
  ///用户信息
  bool userLogin = false;
  String udt = "";//用户token


  ///底部tab当前下标
  int tabIndex = 0;


  ///实例对象
  BuildContext context;

  ///用户登录页面实例
  bool userLoginContext = false;
  ///商户登录页面实例
  bool shopLoginContext = false;


  ///屏保视频链接
  String screenSaverUrl = '';

  ///已经存在的page集合
  Map<String,BuildContext> pages = {};


  bool dialogBluetoothShow = true;


}