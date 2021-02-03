import 'package:app_flutter/basic/configs/constant.dart';
import 'package:app_flutter/pages/game_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchPage extends StatefulWidget {
  SearchPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  State<StatefulWidget> createState() {
    return SearchPageState();
  }
}

class SearchPageState extends State<SearchPage> {
  bool _onOff = true;
  bool _dialogShow = false;
  var _username = ''; //搜索关键字
  var _isShowClear = false; //是否显示输入框尾部的清除按钮

  //焦点
  FocusNode _focusNodeUserName = new FocusNode();

  //用户名输入框控制器，此控制器可以监听用户名输入框操作
  TextEditingController _userNameController = new TextEditingController();

  _showLogoutDialog(bool ishow) {
    setState(() {
      _dialogShow = ishow;
    });
  }

  @override
  void initState() {
    super.initState();
    //设置焦点监听
    _focusNodeUserName.addListener(_focusNodeListener);
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
  }

  @override
  void dispose() {
    // 移除焦点监听
    _focusNodeUserName.removeListener(_focusNodeListener);
    _userNameController.dispose();
    super.dispose();
  }

  // 监听焦点
  Future<Null> _focusNodeListener() async {
    // if (_focusNodeUserName.hasFocus) {
    //   print("用户名框获取焦点");
    //   // 取消密码框的焦点状态
    //   _focusNodePassWord.unfocus();
    // }
    // if (_focusNodePassWord.hasFocus) {
    //   print("密码框获取焦点");
    //   // 取消用户名框焦点状态
    //   _focusNodeUserName.unfocus();
    // }
  }

  @override
  Widget build(BuildContext context) {
    OutlineInputBorder _outlineInputBorder = OutlineInputBorder(
      // gapPadding: 0,
      borderSide: BorderSide(
        color: Color(0XFFF2F2F2),
        // color: Colors.white,
      ),
    );

    OutlineInputBorder outline =  OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.white,  // 边框颜色
      ),
    );

    Widget topSearch = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [

        new Expanded(
          flex: 1,
            child:
        ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: Container(
            // width: 284,
            height: 27,
            alignment: Alignment.center,
            color: Color(0XFFF2F2F2),
            padding: EdgeInsets.only(left: 5, right: 10, top: 0, bottom: 0),
            child: GestureDetector(
              onTap: () {
                // Navigator.push(context,
                //     MaterialPageRoute(builder: (context) => SearchPage()));
              },
              child: Row(
                children: [
                  Image.asset(
                    "assets/imgs/game_search.png",
                    width: ScreenUtil().setWidth(54),
                    height: ScreenUtil().setHeight(30),
                  ),
                  new Expanded(
                    flex: 1,
                    child:
                  new Container(
                    // width: 243,
                    height: 27,
                    alignment: Alignment.bottomLeft,
                    padding: EdgeInsets.only(top: 0),
                    child:

                    new TextField(
                      controller: _userNameController,
                      focusNode: _focusNodeUserName,
                      cursorColor: Color(0xFFFF7A00),
                      onTap:(){
                        FocusScope.of(context).requestFocus(_focusNodeUserName);
                      },
                      keyboardType: TextInputType.text,
//                    autofocus: false,
//                    obscureText: false,
                      onEditingComplete: () {

                      },
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(top: 0),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(3),
                            borderSide: BorderSide.none,),
                        hintText: '请输入',
                        hintStyle: TextStyle(
                          fontSize: 12,
                          color: Color.fromRGBO(0, 0, 0, 0.32),
                          fontWeight: FontWeight.w400,
                        ),
                        suffixIcon: (_isShowClear)
                            ? IconButton(
                            icon: Image.asset(
                              "assets/imgs/search_delete.webp",
                              width: ScreenUtil().setWidth(30),
                              height: ScreenUtil().setHeight(30),
                            ),
                            onPressed: () {
                              // 清空输入框内容
                              _userNameController.clear();
                            },
                            padding:EdgeInsets.only(right: 0)
                        )
                            : null,
                      ),
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                          color: Color(0xFFF3D3D3D),
                          textBaseline: TextBaseline.alphabetic
                      ),

                      onChanged: (value){

                      },
                    ),


                    // new TextFormField(
                    //   controller: _userNameController,
                    //   focusNode: _focusNodeUserName,
                    //   cursorColor: Color(0xFFFF7A00),
                    //   style: new TextStyle(
                    //       fontSize: 12, color: Color(0xFFF3D3D3D),
                    //       textBaseline: TextBaseline.alphabetic),
                    //   //设置键盘类型
                    //   decoration: InputDecoration(
                    //     contentPadding: EdgeInsets.only(top: 0),
                    //     hintText: "请输入",
                    //     border: _outlineInputBorder,
                    //     focusedBorder: _outlineInputBorder,
                    //     enabledBorder: _outlineInputBorder,
                    //     disabledBorder: _outlineInputBorder,
                    //     focusedErrorBorder: _outlineInputBorder,
                    //     errorBorder: _outlineInputBorder,
                    //     //尾部添加清除按钮
                    //     suffixIcon: (_isShowClear)
                    //         ? IconButton(
                    //             icon: Image.asset(
                    //               "assets/imgs/search_delete.webp",
                    //               width: ScreenUtil().setWidth(30),
                    //               height: ScreenUtil().setHeight(30),
                    //             ),
                    //             onPressed: () {
                    //               // 清空输入框内容
                    //               _userNameController.clear();
                    //             },
                    //         padding:EdgeInsets.only(right: 0)
                    //           )
                    //         : null,
                    //   ),
                    //   //保存数据
                    //   onSaved: (String value) {
                    //     _username = value;
                    //   },
                    // ),

                  ),
            ),
                ],
              ),
            ),
          ),
        ),
    ),

        new Padding(
          padding: EdgeInsets.only(left: 15, right: 15),
          child: Text(
            !_isShowClear ? "搜索": '取消',
            style: TextStyle(
              color: Color(0XFF2689FF),
              fontSize: 13.0,
            ),
          ),
        ),
      ],
    );

    Widget swapTitle = new Container(
      margin: EdgeInsets.only(right: 15, left: 15, top: 20, bottom: 20),
      child: new Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: [
              Text(
                "搜索历史",
                style: TextStyle(
                  color: Color(0XFF303030),
                  fontSize: 16.0,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Image.asset(
                "assets/imgs/remove.png",
                width: ScreenUtil().setWidth(54),
                height: ScreenUtil().setHeight(30),
              ),
              Text(
                "清空历史",
                style: TextStyle(
                  color: Color(0XFF999999),
                  fontSize: 13.0,
                ),
              ),
            ],
          ),
        ],
      ),
    );

    //标签：一个渐变颜色的集合
    List<Widget> Boxs(int a) => List.generate(a, (index) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: Container(
              width: 60,
              height: 22,
              alignment: Alignment.center,
              color: Color(0xFFF4F4F4),
              child: Text(
                "${index}" + "杀手",
                style: TextStyle(
                  color: Color(0XFF747474),
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          );
        });

    //item_grid
    Widget itemGrid = Container(
      width: 138,
      height: 40,
      child: Stack(
        children: [
          Container(
            width: 118,
            margin: EdgeInsets.only(left: 20),
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                Color(0XFFFFF7EE),
                Color(0XFFFFFFFF),
              ]),
            ),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 35),
                child: Text('少年三国',
                    style: TextStyle(
                        color: Color(0XFFEC7443),
                        fontSize: 14,
                        fontFamily: 'PingFang',
                        fontWeight: FontWeight.w500,
                        letterSpacing: 1,
                        decoration: TextDecoration.none)),
              ),
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              IMG_PATH + 'default_default.png',
            ),
          ),
        ],
      ),
    );

    //list item
    Widget itemList = new Container(
      // width: 351,
      height: 85,
      margin: EdgeInsets.only(top: 10),
      // color: Colors.orange,
      child: Stack(
        children: [
          new Padding(
            padding: EdgeInsets.only(left: 10, right: 10, top: 0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: Container(
                color: Colors.white,
                height: 115,
                child: Stack(
                  children: [
                    new Padding(
                      padding: EdgeInsets.only(left: 87, top: 22),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "天使纪元",
                          style: TextStyle(
                            color: Color(0XFF000000),
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                    ),
                    new Padding(
                      padding: EdgeInsets.only(left: 87, top: 47, right: 87),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Wrap(
                          spacing: 10, //主轴上子控件的间距
                          runSpacing: 5, //交叉轴上子控件之间的间距
                          children: Boxs(2), //要显示的子控件集合
                        ),
                      ),
                    ),
                    new Padding(
                      padding: EdgeInsets.only(right: 12),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Container(
                            width: 75,
                            height: 25,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  colors: [
                                    Color(0xFFFFAD00),
                                    Color(0xFFFF7A00),
                                  ],
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter),
                            ),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => GamePage()));
                              },
                              child: Text(
                                "秒玩",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          new Padding(
            padding: EdgeInsets.only(left: 20, top: 12.5),
            child: Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(6),
                  child: Image.asset(
                    IMG_PATH + 'default_default.png',
                    width: 60,
                    height: 60,
                  ),
                ),
                new Offstage(
                    offstage: false,
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Image.asset(
                        IMG_PATH + 'high_quality_goods.png',
                        width: ScreenUtil.getInstance().setWidth(80),
                        height: ScreenUtil.getInstance().setWidth(40),
                      ),
                    ))
              ],
            ),
          ),
        ],
      ),
    );

    Widget customScrollView = CustomScrollView(
      slivers: <Widget>[
        SliverOffstage(offstage: _isShowClear,
          sliver: SliverToBoxAdapter(
            child: swapTitle,
          ),
        ),

        SliverOffstage(offstage: _isShowClear,
        sliver:         SliverToBoxAdapter(
          child: Container(
            width: double.infinity,
            height: 50,
            margin: EdgeInsets.only(left: 15, right: 15),
            child: Wrap(
              spacing: 10, //主轴上子控件的间距
              runSpacing: 5, //交叉轴上子控件之间的间距
              children: Boxs(4), //要显示的子控件集合
            ),
          ),
        ),),

    SliverOffstage(offstage: _isShowClear,
    sliver: SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.only(left: 15, top: 30),
        child: Text(
          "热门搜索",
          style: TextStyle(
            color: Color(0XFF303030),
            fontSize: 16.0,
          ),
        ),
      ),
    ),
    ),

    SliverOffstage(offstage: _isShowClear,
    sliver: SliverPadding(
      padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
      sliver: new SliverGrid(
        //Grid
        gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, //Grid按两列显示
          mainAxisSpacing: 15.0,
          crossAxisSpacing: 30.0,
          childAspectRatio: 3.45,
        ),
        delegate: new SliverChildBuilderDelegate(
              (BuildContext context, int index) {
            //创建子widget
            return itemGrid;
          },
          childCount: 7,
        ),
      ),
    ),
    ),

        // SliverToBoxAdapter(
        //   child: listTitle,
        // ),

        //List
    SliverOffstage(offstage: !_isShowClear,
    sliver: new SliverList(
      delegate:
      new SliverChildBuilderDelegate((BuildContext context, int index) {
        //创建列表项
        return itemList;
      }, childCount: 3 //50个列表项
      ),
    ),
    ),


      ],
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(left:15, top: 40),
            child: topSearch,
          ),
          Padding(padding: EdgeInsets.only(top: 80), child: customScrollView),
        ],
      ),
    );
  }
}
