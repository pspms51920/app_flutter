import 'dart:convert';

import 'package:app_flutter/basic/configs/constant.dart';
import 'package:app_flutter/basic/model/factoty/entity_factory.dart';
import 'package:dio/dio.dart';


/// @description


var dio = Dio();

class DioUtil {
  static Future<T> post<T>(String path, {Map<String, dynamic> data,CancelToken cancelToken,String baseUrl}) async {
    dio.options.baseUrl = (baseUrl == null ? URL_BASE : baseUrl);
    Response response = await dio.post(path, data: data,cancelToken: cancelToken);
    return Future.value(EntityFactory.generateOBJ<T>(jsonDecode(jsonEncode(response.data))));
  }
  static Future<T> get<T>(String path, {Map<String, dynamic> queryParameters,CancelToken cancelToken,String baseUrl}) async {
    dio.options.baseUrl = (baseUrl == null ? URL_BASE : baseUrl);
    Response response = await dio.get(path, queryParameters: queryParameters,cancelToken: cancelToken);
    return Future.value(EntityFactory.generateOBJ<T>(jsonDecode(jsonEncode(response.data))));
  }
  static download(String urlPath, String savePath, {ProgressCallback onReceiveProgress}) {
    print("savePath = $savePath");
    dio.download(urlPath, savePath, onReceiveProgress: onReceiveProgress);
  }
}
