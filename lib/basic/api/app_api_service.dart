import 'package:app_flutter/basic/api/dio_util.dart';
import 'package:flutter/material.dart';

/// @description


class AppApiService{
  static Future<T> padConfig<T>(Map<String,bool> data) {
    return DioUtil.get<T>("/config/specify/pad",queryParameters: data);
  }

  static Future<T> padConfig1<T>(bool noauth) {
    Map<String,bool> data = {'noauth':noauth};
    return DioUtil.get<T>("/config/specify/pad",queryParameters: data);
  }

  static Future<T> shopLogin<T>(Map<String,dynamic> data) {
    return DioUtil.post<T>("/shop/login",data: data);
  }

  static Future<T> loginWx<T>(Map<String, String> data) {
    return DioUtil.post<T>("user/phone_5number_login",data: data);
  }


  static Future<T> deviceType<T>(Map<String,dynamic> data) {
    return DioUtil.get<T>("/shop/device_type",queryParameters: data);
  }
  static Future<T> getCsBannerlist<T>(Map<String,dynamic> data) {
    return DioUtil.get<T>("/cs/banner/getCsBannerList",queryParameters: data);
  }

}