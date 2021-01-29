import 'dart:convert';
import 'dart:math';
import 'package:app_flutter/basic/configs/app.core.dart';
import 'package:app_flutter/basic/model/user_login_result_entity.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'constant.dart';

/// @description

class Fun {
		static String _S4() {
				String alphabet = '1234567890qwertyuiopasdfghjklzxcvbnm';
				int strlenght = 4;
				var result = "";
				for (var i = 0; i < strlenght; i++) {
						result += alphabet[Random().nextInt(alphabet.length)];
				}
				return result;
		}
		
		///生成随即数
		static String getGUID() {
				return (_S4() +
						_S4() +
						"-" +
						_S4() +
						"-" +
						_S4() +
						"-" +
						_S4() +
						"-" +
						_S4() +
						_S4() +
						_S4());
		}
		
		//是否正在进入课程
		static bool enterCourseIng = false;
		

		///更新用户信息
		static void updateUserInfo(UserLoginResultEntity data) {
				//更新本地缓存
				AppCore
						.getInstance()
						.userLoginResultEntity = data;
				//更新文件缓存
				SharedPreferences.getInstance().then((sp) {
						sp.setString(SP_USER_INFO_KEY, jsonEncode(data));
				});
		}
		
		///清除商户信息
		static void clearShopInfo() async {
				// AppCore
				// 		.getInstance()
				// 		.shopInfo = null;
				AppCore
						.getInstance()
						.shopLoginName = null;
				SharedPreferences sp = await SharedPreferences.getInstance();
				await sp.remove(SP_SHOP_INFO_KEY);
				await sp.remove(SP_SHOP_LOIN_NAME_KEY);
		}
		
		///清除用户信息
		static void clearLoginInfo() async {
				AppCore
						.getInstance()
						.userLoginResultEntity = null;
				SharedPreferences sp = await SharedPreferences.getInstance();
				await sp.remove(SP_USER_INFO_KEY);
		}


		///init 存放page
		static void putPage(BuildContext ctx,String pageName){
			if(!AppCore.getInstance().pages.containsKey(pageName)){
				AppCore.getInstance().pages[pageName] = ctx;
			}
		}
		///dispose 移除page
		static void removePage(String pageName){
			if(AppCore.getInstance().pages.containsKey(pageName)){
				AppCore.getInstance().pages.remove(pageName);
			}
		}

}
