
import 'package:app_flutter/basic/model/banner_entity.dart';
import 'package:app_flutter/basic/model/pad_config_entity.dart';
import 'package:app_flutter/basic/model/user_login_result_entity.dart';

class EntityFactory {
  static T generateOBJ<T>(json) {
    if (1 == 0) {
      return null;
    } else if (T.toString() == "PadConfigEntity") {
      return PadConfigEntity.fromJson(json) as T;
    } else if(T.toString() == "BannerEntity"){
      return BannerEntity.fromJson(json) as T;
    } else if(T.toString() == ""){
      return UserLoginResultEntity.fromJson(json) as T;
    }else {
      return json as T;
    }
  }
}