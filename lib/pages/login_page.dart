import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginDemoPageState createState() => _LoginDemoPageState();
}

class _LoginDemoPageState extends State<LoginPage> {
  //焦点
  FocusNode _focusNodeUserName = new FocusNode();
  FocusNode _focusNodePassWord = new FocusNode();

  //用户名输入框控制器，此控制器可以监听用户名输入框操作
  TextEditingController _userNameController = new TextEditingController();

  //表单状态
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  var _password = ''; //用户名
  var _username = ''; //密码
  var _isShowPwd = false; //是否显示密码
  var _isShowClear = false; //是否显示输入框尾部的清除按钮

  @override
  void initState() {
    // TODO: implement initState
    //设置焦点监听
    _focusNodeUserName.addListener(_focusNodeListener);
    _focusNodePassWord.addListener(_focusNodeListener);
    //监听用户名框的输入改变
    _userNameController.addListener(() {
      print(_userNameController.text);

      // 监听文本框输入变化，当有内容的时候，显示尾部清除按钮，否则不显示
      if (_userNameController.text.length > 0) {
        _isShowClear = true;
      } else {
        _isShowClear = false;
      }
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    // 移除焦点监听
    _focusNodeUserName.removeListener(_focusNodeListener);
    _focusNodePassWord.removeListener(_focusNodeListener);
    _userNameController.dispose();
    super.dispose();
  }

  // 监听焦点
  Future<Null> _focusNodeListener() async {
    if (_focusNodeUserName.hasFocus) {
      print("用户名框获取焦点");
      // 取消密码框的焦点状态
      _focusNodePassWord.unfocus();
    }
    if (_focusNodePassWord.hasFocus) {
      print("密码框获取焦点");
      // 取消用户名框焦点状态
      _focusNodeUserName.unfocus();
    }
  }

  /**
   * 验证用户名
   */
  String validateUserName(value) {
    // 正则匹配手机号
    RegExp exp = RegExp(
        r'^((13[0-9])|(14[0-9])|(15[0-9])|(16[0-9])|(17[0-9])|(18[0-9])|(19[0-9]))\d{8}$');
    if (value.isEmpty) {
      return '用户名不能为空!';
    } else if (!exp.hasMatch(value)) {
      return '请输入正确手机号';
    }
    return null;
  }

  /**
   * 验证密码
   */
  String validatePassWord(value) {
    if (value.isEmpty) {
      return '密码不能为空';
    } else if (value.trim().length < 6 || value.trim().length > 18) {
      return '密码长度不正确';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
    print(ScreenUtil().scaleHeight);

    OutlineInputBorder _outlineInputBorder = OutlineInputBorder(
      gapPadding: 0,
      borderSide: BorderSide(
        color: Colors.white,
      ),
    );

    // title 图片区域
    Widget titleArea = new Padding(
        padding: EdgeInsets.only(left: ScreenUtil().setWidth(25)),
        child:

        new Text('你好， \n欢迎来到游族云游戏',
            style: TextStyle(
                color: Color(0XFF4D4D4D),
                fontSize: 25,
                fontFamily: 'PingFang',
                fontWeight: FontWeight.w500,
                letterSpacing: 1,
                decoration: TextDecoration.none))


    );

    //输入文本框区域
    Widget inputTextArea = new Container(
      margin: EdgeInsets.only(left: 20, right: 20),
      decoration: new BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          color: Colors.white),
      child: new Form(
        key: _formKey,
        child: new Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                new Container(
                  width: 210,
                  height: 60,
                  alignment: Alignment.bottomLeft,
                  child: new TextFormField(
                    controller: _userNameController,
                    focusNode: _focusNodeUserName,
                    cursorColor: Color(0xFFFF7A00),
                    style:
                        new TextStyle(fontSize: 16, color: Color(0xFFF3D3D3D)),
                    //设置键盘类型
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: "请输入手机号",
                      border: _outlineInputBorder,
                      focusedBorder: _outlineInputBorder,
                      enabledBorder: _outlineInputBorder,
                      disabledBorder: _outlineInputBorder,
                      focusedErrorBorder: _outlineInputBorder,
                      errorBorder: _outlineInputBorder,
                      //尾部添加清除按钮
                      suffixIcon: (_isShowClear)
                          ? IconButton(
                              icon: Icon(Icons.clear),
                              onPressed: () {
                                // 清空输入框内容
                                _userNameController.clear();
                              },
                            )
                          : null,
                    ),
                    //验证用户名
                    // validator: validateUserName,
                    //保存数据
                    onSaved: (String value) {
                      _username = value;
                    },
                  ),
                ),
                new Padding(padding: EdgeInsets.only(left: 5,right: 10),
                child: Image.asset(
                  "assets/imgs/search_delete.webp",
                  width: ScreenUtil().setWidth(30),
                  height: ScreenUtil().setHeight(30),
                ),),
                Text(
                  "获取验证码",
                  style: TextStyle(
                    color: Color(0XFF2689FF),
                    fontSize: 16.0,
                  ),
                ),
              ],
            ),
            new Container(
              color: Color(0xFFCCCCCC),
              width: 325,
              height: 1,
            ),
            new Padding(padding: EdgeInsets.only(top: 10)),
            new TextFormField(
              focusNode: _focusNodePassWord,
              cursorColor: Color(0xFFFF7A00),
              decoration: InputDecoration(
                hintText: "请输入验证码",
                border: _outlineInputBorder,
                focusedBorder: _outlineInputBorder,
                enabledBorder: _outlineInputBorder,
                disabledBorder: _outlineInputBorder,
                focusedErrorBorder: _outlineInputBorder,
                errorBorder: _outlineInputBorder,
              ),
              // obscureText: !_isShowPwd,
              //密码验证
              // validator: validatePassWord,
              //保存数据
              onSaved: (String value) {
                _password = value;
              },
            ),
            new Container(
              color: Color(0xFFCCCCCC),
              width: 325,
              height: 1,
            ),
          ],
        ),
      ),
    );

    //边框样式

    // 登录按钮区域
    Widget loginButtonArea = new Container(
      margin: EdgeInsets.only(
          left: ScreenUtil().setHeight(72.5),
          right: ScreenUtil().setHeight(72.5)),
      width: 226.5,
      height: 48.0,
      child: new RaisedButton(
        color: Color(0XFFFF7A00),
        child: Text(
          "验证登录",
          style: TextStyle(
              color: Colors.white,
              fontSize: 17,
              fontFamily: 'PingFang',
              letterSpacing: 1,
              fontWeight: FontWeight.w600,
              decoration: TextDecoration.none),
        ),
        // 设置按钮圆角
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(100.0)),
        onPressed: () {
          //点击登录按钮，解除焦点，回收键盘
          _focusNodePassWord.unfocus();
          _focusNodeUserName.unfocus();

          if (_formKey.currentState.validate()) {
            //只有输入通过验证，才会执行这里
            _formKey.currentState.save();
            //todo 登录操作
            print("$_username + $_password");
          }


        },
      ),
    );

    //忘记密码  立即注册
    Widget topArea = new Container(
      margin: EdgeInsets.only(right: 0, left: 0),
      child: new Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          FlatButton(
            minWidth: 10,
            child: Image.asset(
              "assets/imgs/ic_back_cancel.webp",
              width: ScreenUtil().setWidth(38),
              height: ScreenUtil().setHeight(38),
            ),
            //忘记密码按钮，点击执行事件
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          FlatButton(
            child: Text(
              "游族账号",
              style: TextStyle(
                color: Color(0XFFFF6E00),
                fontSize: 16.0,
              ),
            ),
            //点击快速注册、执行事件
            onPressed: () {},
          )
        ],
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      // 外层添加一个手势，用于点击空白部分，回收键盘
      body: new GestureDetector(
        onTap: () {
          // 点击空白区域，回收键盘
          print("点击了空白区域");
          _focusNodePassWord.unfocus();
          _focusNodeUserName.unfocus();
        },
        child: new ListView(
          children: <Widget>[
            new Padding(
                padding: EdgeInsets.only(top: ScreenUtil().setHeight(44))),
            topArea,
            new Padding(
                padding: EdgeInsets.only(top: ScreenUtil().setHeight(46))),
            titleArea,
            new Padding(
                padding: EdgeInsets.only(top: ScreenUtil().setHeight(80))),
            inputTextArea,
            new Padding(
                padding: EdgeInsets.only(top: ScreenUtil().setHeight(220))),
            loginButtonArea,
          ],
        ),
      ),
    );
  }
}
