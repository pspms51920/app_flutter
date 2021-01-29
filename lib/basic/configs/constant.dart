import 'package:app_flutter/basic/configs/config.dart';
import 'package:flutter/material.dart';

/// @description


///share_perference key=========================================================
//权限
const String SP_PERMISSION_LOCATION_KEY = "location";
const String SP_PERMISSION_STORAGE_KEY = "storage";
//商户SHOP
const String SP_SHOP_INFO_KEY='shopInfo';
//用户info
const String SP_USER_INFO_KEY='userInfo';
//商户登录名称
const String SP_SHOP_LOIN_NAME_KEY='shopLoginName';
//骑行记录
const String SP_COURSE_RESULT_KEY = 'courseResult';

///网络请求======================================================================
const String APP_SITE = 'https://freebrio.com';
const String URL_BASE = dev ? "http://staging-api.freebrio.com/client-api/v1/" : "http://api.freebrio.com/client-api/v1/" ;
const String URL_BASE_02 = dev ? "http://staging-api.freebrio.com/client-api/v2/" : "http://api.freebrio.com/client-api/v2/" ;
const String URL_BASE_ADMIN = dev ? "http://staging-api.freebrio.com/admin-api/v1/" : "http://api.freebrio.com/admin-api/v1/" ;


///Image 路径====================================================================
const String IMG_PATH = "assets/imgs/";


///colors ======================================================================
class CommonColors{
  static const Color tabSelectColor = Color(0XFF27E5FD);
  static const Color tabUnSelectColor = Color(0xFF000000);
}
class Refresh {
  static const String moreInfo = "更新于 %T";

  ///下拉刷新
  static const String refreshText = "下拉刷新";
  static const String refreshReadyText = "释放刷新";
  static const String refreshingText = "正在刷新...";
  static const String refreshedText = "刷新完成";

  ///上拉加载
  static const String loadText = "上拉加载更多";
  static const String loadReadyText = "释放加载更多";
  static const String loadingText = "正在加载中...";
  static const String loadedText = "加载完成";
  static const String noMoreText = "没有更多数据";
}

class CourseRecommendTabType{
		static int cycleLevel = 0;
		static int difficultyDegree = 1;
		static int coach = 2;
		static int music = 3;
		static int time = 4;
}

class CourseSortType{
		static const String all = "COMPREHENSIVE";
		static const String hot = "HOTTEST";
		static const String lastDate = "UP_TO_DATE";
}