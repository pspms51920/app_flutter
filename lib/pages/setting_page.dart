import 'dart:ffi';

import 'package:app_flutter/basic/configs/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingPage extends StatefulWidget {
  SettingPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  State<StatefulWidget> createState() {
    return SettingPageState();
  }
}

class SettingPageState extends State<SettingPage> {
  bool _onOff = true;
  bool _dialogShow = false;

  _showLogoutDialog(bool ishow){
    setState(() {
      _dialogShow = ishow;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //top标题
    Widget topTitle = new Container(
      // color: Colors.lightBlue,
      margin: EdgeInsets.only(top: 40),
      height: 44,
      child: new Stack(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child:
                GestureDetector(
                  onTap: (){
                    Navigator.of(context).pop();
                  },
                  child: Padding(
                    padding: EdgeInsets.only(left: 15),
                    child: Icon(Icons.arrow_back_ios_outlined),
                    ),
                ),),

          Align(
              alignment: Alignment.center,
              child: Text(
                "设置",
                style: TextStyle(
                  color: Color(0XFF3D3D3D),
                  fontSize: 18.0,
                ),
              )),
        ],
      ),
    );

    //分割线
    Widget dividerLine = new Container(
      color: Color(0xFFE6E6E6),
      height: 1,
    );

    Widget dividerVertical = new Container(
      color: Color(0xFFE6E6E6),
      width: 1,
      height: ScreenUtil.getInstance().setHeight(95),
    );

    Widget dividerLine10 = new Container(
      color: Color(0xFFE6E6E6),
      height: 10,
    );

    //用户Id
    Widget userid = new Container(
      height: 50,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
              padding: EdgeInsets.only(left: 15),
              child: Text(
                "用户ID",
                style: TextStyle(
                  color: Color(0XFF303030),
                  fontSize: 14.0,
                ),
              )),
          Padding(
              padding: EdgeInsets.only(right: 15),
              child: Text(
                "17600045678",
                style: TextStyle(
                  color: Color(0XFF999999),
                  fontSize: 12.0,
                ),
              )),
        ],
      ),
    );

    //版本更新
    Widget versionUpdate = new Container(
      height: 50,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
              padding: EdgeInsets.only(left: 15),
              child: Text(
                "版本更新",
                style: TextStyle(
                  color: Color(0XFF303030),
                  fontSize: 14.0,
                ),
              )),
          Padding(
            padding: EdgeInsets.only(right: 15),
            child: Row(
              children: [
                Text(
                  "V1.0.0",
                  style: TextStyle(
                    color: Color(0XFF999999),
                    fontSize: 12.0,
                  ),
                ),
                Image.asset(
                  "assets/imgs/home_more.png",
                  width: 18,
                  height: 18,
                ),
              ],
            ),
          ),
        ],
      ),
    );

    //WIFI下自动播放视频
    Widget wifiButton = new Container(
      height: 50,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
              padding: EdgeInsets.only(left: 15),
              child: Text(
                "WIFI下自动播放视频",
                style: TextStyle(
                  color: Color(0XFF303030),
                  fontSize: 14.0,
                ),
              )),
          Padding(
            padding: EdgeInsets.only(right: 15),
            child: CupertinoSwitch(
                value: _onOff,
                onChanged: (value) {
                  setState(() {
                    _onOff = value;
                  });
                }),
          ),
        ],
      ),
    );

    //清除缓存
    Widget cacheClear = new Container(
      height: 50,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
              padding: EdgeInsets.only(left: 15),
              child: Text(
                "清除缓存",
                style: TextStyle(
                  color: Color(0XFF303030),
                  fontSize: 14.0,
                ),
              )),
          Padding(
              padding: EdgeInsets.only(right: 15),
              child: Text(
                "18.66M",
                style: TextStyle(
                  color: Color(0XFF999999),
                  fontSize: 12.0,
                ),
              )),
        ],
      ),
    );

    //用户协议
    Widget userAgreenment = new Container(
      height: 50,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
              padding: EdgeInsets.only(left: 15),
              child: Text(
                "用户协议",
                style: TextStyle(
                  color: Color(0XFF303030),
                  fontSize: 14.0,
                ),
              )),
          Padding(
              padding: EdgeInsets.only(right: 15),
              child: Image.asset(
                "assets/imgs/home_more.png",
                width: 18,
                height: 18,
              )),
        ],
      ),
    );

    //用户协议
    Widget privacyAgreenment = new Container(
      height: 50,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
              padding: EdgeInsets.only(left: 15),
              child: Text(
                "隐私协议",
                style: TextStyle(
                  color: Color(0XFF303030),
                  fontSize: 14.0,
                ),
              )),
          Padding(
              padding: EdgeInsets.only(right: 15),
              child: Image.asset(
                "assets/imgs/home_more.png",
                width: 18,
                height: 18,
              )),
        ],
      ),
    );

    Widget bottomLogout = new Container(
      height: 50,
      width: double.infinity,
      color: Color(0xFFF4F4F4),
      child: Center(
          child: Text(
        "退出登录",
        style: TextStyle(
          color: Color(0XFF2689FF),
          fontSize: 15.0,
        ),
      )),
    );

    Widget dialogLogout = Offstage(
      child: Container(
        color: Color.fromRGBO(0, 0, 0, 0.55),
        width: double.infinity,
        height: double.infinity,
        child: Center(
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                    Radius.circular(ScreenUtil.getInstance().setWidth(18))),
                color: Colors.white),
            width: ScreenUtil.getInstance().setWidth(600),
            height: ScreenUtil.getInstance().setHeight(280),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Padding(
                  child: Text(
                    '退出账号',
                    style: TextStyle(
                        color: Color(0xFF303030),
                        fontSize: ScreenUtil.getInstance().setSp(36),
                        fontFamily: 'PingFang',
                        letterSpacing: ScreenUtil.getInstance().setWidth(1.6),
                        fontWeight: FontWeight.w600,
                        decoration: TextDecoration.none
                    ),
                  ),
                  padding: EdgeInsets.only(
                      top: 30),
                ),
                Padding(
                  child: Text(
                    '确认退出当前账号吗？',
                    style: TextStyle(
                        color: Color(0xFF808080),
                        fontSize: ScreenUtil.getInstance().setSp(24),
                        fontFamily: 'PingFang',
                        letterSpacing: ScreenUtil.getInstance().setWidth(1.6),
                        fontWeight: FontWeight.w600,
                        decoration: TextDecoration.none
                    ),
                  ),
                  padding: EdgeInsets.only(
                      top: 15,
                      bottom: 25,
                      ),
                ),
                dividerLine,
                Container(
                  width: ScreenUtil.getInstance().setWidth(600),
                  child: Row(
                    children: <Widget>[
                      GestureDetector(
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: Color(0xffFFFFFF),width: ScreenUtil.getInstance().setWidth(1)),
                              borderRadius: BorderRadius.all(Radius.circular(
                                  ScreenUtil.getInstance().setWidth(18)))),
                          width: ScreenUtil.getInstance().setWidth(298),
                          height: ScreenUtil.getInstance().setHeight(95),
                          alignment: Alignment.center,
                          child: Text(
                            '取消',
                            style: TextStyle(
                                color: Color(0xFF2689FF),
                                fontSize: ScreenUtil.getInstance().setSp(30),
                                fontFamily: 'PingFang',
                                fontWeight: FontWeight.w500,
                                decoration: TextDecoration.none),
                          ),
                        ),
                        onTap: () {
                          _showLogoutDialog(false);
                        },
                      ),

                      dividerVertical,

                      GestureDetector(
                        child: Container(
                          margin: EdgeInsets.only(
                              left: ScreenUtil.getInstance().setWidth(0)),
                          decoration: BoxDecoration(
                              color: Color(0xffFFFFFF),
                              borderRadius: BorderRadius.all(Radius.circular(
                                  ScreenUtil.getInstance().setWidth(18)))),
                          width: ScreenUtil.getInstance().setWidth(298),
                          height: ScreenUtil.getInstance().setHeight(95),
                          alignment: Alignment.center,
                          child: Text(
                            '确定',
                            style: TextStyle(
                                color: Color(0xFF999999),
                                fontSize: ScreenUtil.getInstance().setSp(30),
                                fontFamily: 'PingFang',
                                fontWeight: FontWeight.w500,
                                decoration: TextDecoration.none),
                          ),
                        ),
                        onTap: () {
                          _showLogoutDialog(false);
                        },
                      ),
                    ],
                  ),
                  padding: EdgeInsets.only(
                      top: ScreenUtil.getInstance().setHeight(0)),
                ),
              ],
              crossAxisAlignment: CrossAxisAlignment.center,
            ),
          ),
        ),
      ),
      offstage: !_dialogShow,
    );

    return Stack(
      children: [
        Scaffold(
          body: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                topTitle,
                Padding(padding: EdgeInsets.only(top: 10)),
                userid,
                dividerLine,
                versionUpdate,
                dividerLine,
                wifiButton,
                dividerLine10,
                cacheClear,
                dividerLine,
                userAgreenment,
                dividerLine,
                privacyAgreenment
              ],
            ),
          ),
          bottomNavigationBar:
              GestureDetector(
                onTap: (){
                  _showLogoutDialog(true);
                },
                child: bottomLogout,),
        ),

        dialogLogout,
      ],
    );
  }
}
