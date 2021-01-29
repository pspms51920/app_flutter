import 'dart:convert';
import 'package:app_flutter/basic/configs/app.core.dart';
import 'package:app_flutter/basic/configs/fun.dart';
import 'package:app_flutter/basic/util/log_util.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// @description 请求拦截器

class RequestResponseInterceptor extends Interceptor {
  @override
  onRequest(RequestOptions options) async {
    options.headers["Content-Type"] = "application/json; charset=UTF-8";
    options.headers["X-Client-Type"] = "AndroidPad";
    options.headers["X-Client-Version"] = AppCore.getInstance().xClientVersion;
    options.headers["X-Device-Number"] = AppCore.getInstance().xDeviceNumber;
    // if(AppCore.getInstance().shopInfo != null){
    //   options.headers["sdt"] = AppCore.getInstance().shopInfo.device.token;
    // }
    if(AppCore.getInstance().userLoginResultEntity != null){
      options.headers["udt"] = AppCore.getInstance().userLoginResultEntity.deviceToken;
    }
    return options;
  }

  // @override
  // onError(DioError err) {
  //   return err;
  // }

  @override
  onResponse(Response response) {
    LogUtil.d('response=========================> start\n ${response.data} response===============================>end\n');
    // if(response.request.responseType == ResponseType.stream)
    //   return response;
    // if(response.request.responseType == ResponseType.plain)
    //   response.data = jsonDecode(response.data);
    // if (response.data['code'] == 200) {
    //   response.data = response.data['data'];
    // } else if(response.data['code'] == 401){// 用户认证失效
    //   //如果userlogin页面已经存在了，就不再跳转
    //   if(AppCore.getInstance().context != null && !AppCore.getInstance().userLoginContext){
    //     // if(AppCore.getInstance().shopInfo != null){
    //       Fun.clearLoginInfo();
    //       Navigator.pushNamedAndRemoveUntil(AppCore.getInstance().context,'userLogin',(route) => route == null);
    //     // }
    //   }
    // } else if(response.data['code'] == 402){// 企业认证失效
    //   //如果shoplogin页面已经存在了，就不再跳转
    //   if(AppCore.getInstance().context != null && !AppCore.getInstance().shopLoginContext){
    //     Fun.clearShopInfo();
    //     Fun.clearLoginInfo();
    //     Navigator.pushNamedAndRemoveUntil(AppCore.getInstance().context,'shopLogin',(route)=> route == null);
    //   }
    // } else {
    //   return DioError(error: response.data['code'], message: response.data['msg']);
    // }
    // return response;
  }

}
