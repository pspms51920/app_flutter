import 'package:app_flutter/basic/configs/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

//首页底部按钮
class TabBottom extends StatelessWidget {
  bool selectAble;
  String title;
  String iconName;
  String activeIconName;
  int index;

  TabBottom({
    @required this.index,
    this.title,
    @required this.iconName,
    @required this.activeIconName,
    @required this.selectAble,
  })  : assert(index != null),
        assert(iconName != null),
        assert(selectAble != null);

  @override
  Widget build(BuildContext context) {
    return Tab(
      // text: title,
      // icon: Image.asset(
      //   selectAble ? IMG_PATH + activeIconName : IMG_PATH + iconName,
      //   width: 20,
      //   height: 20,
      //   fit: BoxFit.contain,
      // ),
      child: new Container(
        decoration: new BoxDecoration(
            color: selectAble ? Color(0xFFF4F4F4): Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(100.0)),
            // border: Border.all(width: 2, color: Color(0xFFF4F4F4))
        ),
        padding: EdgeInsets.all(1),
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              selectAble ? IMG_PATH + activeIconName : IMG_PATH + iconName,
              width: ScreenUtil().setWidth(44),
              height: ScreenUtil().setHeight(44),
            ),
            new Padding(
              padding: EdgeInsets.only(left: ScreenUtil().setHeight(10)),
              child: Text(selectAble ? title : "",
                  style: TextStyle(
                      color: Color(0xFFFF8000),
                      fontSize: 12,
                      letterSpacing: 1,
                      fontWeight: FontWeight.w600,
                      decoration: TextDecoration.none)),
            ),
          ],
        ),
      ),
    );
  }
}
