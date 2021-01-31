import 'package:app_flutter/basic/configs/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new HomePageState(title: "主页")
    );
  }
}

class HomePageState extends StatefulWidget {
  HomePageState({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageView createState() => new _HomePageView();
}

class _HomePageView extends State<HomePageState>{

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
    //title提示
    Widget gridTitle = new Container(
      margin: EdgeInsets.only(right: 10, left: 10, top: 20, bottom: 20),
      child: new Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[

          Row(
            children: [
              Image.asset(
                "assets/imgs/home_3.png",
                width: ScreenUtil().setWidth(54),
                height: ScreenUtil().setHeight(30),
              ),
              Text(
                "最近在玩",
                style: TextStyle(
                  color: Color(0XFF303030),
                  fontSize: 16.0,
                ),
              ),
            ],
          ),

          Row(
            children: [
              Text(
                "更多",
                style: TextStyle(
                  color: Color(0XFF999999),
                  fontSize: 13.0,
                ),
              ),
              Image.asset(
                "assets/imgs/home_more.png",
                width: ScreenUtil().setWidth(54),
                height: ScreenUtil().setHeight(30),
              ),
            ],
          ),
        ],
      ),
    );

    //title提示
    Widget listTitle = new Container(
      margin: EdgeInsets.only(right: 10, left: 10, top: 20, bottom: 20),
      child: new Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[

          Image.asset(
            "assets/imgs/home_4.png",
            width: ScreenUtil().setWidth(54),
            height: ScreenUtil().setHeight(30),
          ),
          Text(
            "新游上线",
            style: TextStyle(
              color: Color(0XFF303030),
              fontSize: 16.0,
            ),
          ),
        ],
      ),
    );

    //grid item
    Widget itemGrid = Container(
      width: 109,
      height: 171,
      color: Colors.greenAccent,
      child:
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                children: <Widget>[
                  ClipRRect(
                    borderRadius:
                    BorderRadius.circular(4),
                    child: FadeInImage.assetNetwork(
                      width: 109,
                      height: 109,
                      imageCacheHeight: 109,
                      imageCacheWidth:109,
                      placeholder: IMG_PATH +
                          'default_default.png',
                      image: IMG_PATH +
                          'placeholder.png',
                    ),
                  ),
                  new Offstage(
                      offstage: false,
                      child: Align(
                        alignment:
                        Alignment.topLeft,
                        child: Image.asset(
                          IMG_PATH +
                              'high_quality_goods.png',
                          width: ScreenUtil
                              .getInstance()
                              .setWidth(80),
                          height: ScreenUtil
                              .getInstance()
                              .setWidth(40),
                        ),
                      ))
                ],
              ),
              new Padding(padding: EdgeInsets.only(top: ScreenUtil().setHeight(20))),
              new Text('少年三国',
                  style: TextStyle(
                      color: Color(0XFF1A1A1A),
                      fontSize: 14,
                      fontFamily: 'PingFang',
                      fontWeight: FontWeight.w500,
                      letterSpacing: 1,
                      decoration: TextDecoration.none)),
              new Padding(padding: EdgeInsets.only(top: ScreenUtil().setHeight(9))),
              new Text('9月8日 玩过',
                  style: TextStyle(
                      color: Color(0XFFEC7443),
                      fontSize: 14,
                      fontFamily: 'PingFang',
                      fontWeight: FontWeight.w500,
                      letterSpacing: 1,
                      decoration: TextDecoration.none)),
            ],
          ),
    );

    //标签：一个渐变颜色的集合
    List<Widget> Boxs() => List.generate(2, (index) {
      return
        ClipRRect(
          borderRadius:
          BorderRadius.circular(100),
          child: Container(
            width: 60,
            height: 22,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                Color(0XFFF4F4F4),
                Color(0XFFF5F5F5),
                Color(0XFFF6F6F6)
              ]),
            ),
            child: Text(
              "${index}",
              style: TextStyle(
                color: Color(0XFF747474),
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        );
    });

    //list item
    Widget itemList = new Container(
      // width: 351,
      height: 127,
      margin: EdgeInsets.only(top: 10),
      // color: Colors.orange,
      child: Stack(
        children: [

          new Padding(padding: EdgeInsets.only(left: 10,right: 10, top: 12),
            child:
            ClipRRect(
              borderRadius:
              BorderRadius.circular(4),
              child: Container(
                color: Colors.white,
                height: 115,
                child: Stack(
                  children: [

                    new Padding(padding: EdgeInsets.only(left: 109, top: 30),
                    child: Align(alignment: Alignment.topLeft,
                      child: Text(
                        "天使纪元",
                        style: TextStyle(
                          color: Color(0XFF000000),
                          fontSize: 16.0,
                        ),
                      ),),),


                    new Padding(padding: EdgeInsets.only(left: 109, top: 65, right: 87),
                    child:
                    Align(alignment: Alignment.topLeft,
                    child: Wrap(
                      spacing: 10, //主轴上子控件的间距
                      runSpacing: 5, //交叉轴上子控件之间的间距
                      children: Boxs(), //要显示的子控件集合
                    ),),

                    ),



                    new Padding(padding: EdgeInsets.only(right: 12),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child:
                      ClipRRect(
                        borderRadius:
                        BorderRadius.circular(100),
                        child: Container(
                          width: 75,
                          height: 30,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(colors: [
                              Colors.orangeAccent,
                              Colors.orange,
                              Colors.deepOrange
                            ]),
                          ),
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
                      // new Container(
                      //   width: 75,
                      //   height: 30,
                      //     decoration: BoxDecoration(
                      //       gradient: LinearGradient(colors: [
                      //         Colors.orangeAccent,
                      //         Colors.orange,
                      //         Colors.deepOrange
                      //       ]),
                      //     ),
                      //   child:
                      //   new RaisedButton(
                      //     color: Colors.orange,
                      //     child: Text(
                      //       "秒玩",
                      //       style: TextStyle(
                      //           color: Colors.white,
                      //           fontSize: 13,
                      //           fontFamily: 'PingFang',
                      //           letterSpacing: 1,
                      //           fontWeight: FontWeight.w600,
                      //           decoration: TextDecoration.none),
                      //     ),
                      //     // 设置按钮圆角
                      //     shape:
                      //     RoundedRectangleBorder(borderRadius: BorderRadius.circular(100.0)),
                      //     onPressed: (){
                      //
                      //     },
                      //   ),
                      // ),
                    ),),
                  ],
                ),
              ),
            ),),

          new Padding(padding: EdgeInsets.only(left: 20),
          child:           Stack(
            children: <Widget>[
              ClipRRect(
                borderRadius:
                BorderRadius.circular(6),
                child: FadeInImage.assetNetwork(
                  width: 85,
                  height: 115,
                  imageCacheWidth:85,
                  imageCacheHeight: 115,
                  placeholder: IMG_PATH +
                      'default_default3.png',
                  image: IMG_PATH +
                      'placeholder.png',
                ),
              ),
              new Offstage(
                  offstage: false,
                  child: Align(
                    alignment:
                    Alignment.topLeft,
                    child: Image.asset(
                      IMG_PATH +
                          'high_quality_goods.png',
                      width: ScreenUtil
                          .getInstance()
                          .setWidth(80),
                      height: ScreenUtil
                          .getInstance()
                          .setWidth(40),
                    ),
                  ))
            ],
          ),),


        ],
      ),
    );



    //因为本路由没有使用Scaffold，为了让子级Widget(如Text)使用
    //Material Design 默认的样式风格,我们使用Material作为本路由的根。
    return Material(
      color: Color(0xF8F8F8),
      child: CustomScrollView(
        slivers: <Widget>[

          SliverToBoxAdapter(child:
          Container(
            height: 270,
            child: Swiper(
              index: 0,
              itemCount: 4,
              viewportFraction: 0.88,
              scale: 0.94,
              autoplay: true,
              pagination: SwiperPagination(
                  builder: DotSwiperPaginationBuilder(
                      activeColor: Colors.white,
                      color: Colors.grey,
                      size: 6,
                      activeSize: 6)),
              itemBuilder: (BuildContext context, int index) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: Image.asset(
                    "assets/imgs/tab_mine_click.png",
                    fit: BoxFit.cover,
                  ),
                );
              },
            ),
          ),),

          SliverToBoxAdapter(
            child: gridTitle,
          ),

          SliverPadding(
            padding: const EdgeInsets.all(8.0),
            sliver: new SliverGrid( //Grid
              gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, //Grid按两列显示
                mainAxisSpacing: 1.0,
                crossAxisSpacing: 1.0,
                childAspectRatio: 0.63,
              ),
              delegate: new SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                  //创建子widget
                  return
                    itemGrid;
                  //   new Container(
                  //   alignment: Alignment.center,
                  //   color: Colors.cyan[100 * (index % 9)],
                  //   child: new Text('grid item $index'),
                  // );

                },
                childCount: 3,
              ),
            ),
          ),

          SliverToBoxAdapter(
            child: listTitle,
          ),

          //List
          new SliverList(
            delegate: new SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                  //创建列表项
                  return itemList;
                  //   new Container(
                  //   alignment: Alignment.center,
                  //   color: Colors.lightBlue[100 * (index % 9)],
                  //   child: new Text('list item $index'),
                  // );
                },
                childCount: 3 //50个列表项
            ),
          ),
        ],
      ),
    );



  }



}