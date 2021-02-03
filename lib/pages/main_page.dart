import 'package:app_flutter/basic/model/tabtitle_entity.dart';
import 'package:app_flutter/basic/widget/tab_bottom.dart';
import 'package:app_flutter/pages/home_page.dart';
import 'package:app_flutter/pages/test_page.dart';
import 'package:app_flutter/pages/login_page.dart';
import 'package:app_flutter/pages/test_page2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new MainPageState(title: '主页界面'),
    );
  }
}

class MainPageState extends StatefulWidget {
  MainPageState({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MainPageView createState() => new _MainPageView();
}

class _MainPageView extends State<MainPageState>
    with SingleTickerProviderStateMixin {
  TabController mController;
  List<TabTitle> tabList;

  List<bool> selectAbles = List.generate(3, (i) {
    if (i == 0) {
      return true;
    } else {
      return false;
    }
  });

  @override
  void initState() {
    super.initState();
    initTabData();
    mController = TabController(
      length: tabList.length,
      vsync: this,
    );
    mController.addListener(() {
      for (int i = 0; i < selectAbles.length; i++) {
        if (i == mController.index) {
          selectAbles[i] = true;
        } else {
          selectAbles[i] = false;
        }
        setState(() {
          selectAbles;
        });
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    mController.dispose();
  }

  initTabData() {
    tabList = [
      new TabTitle('首页', "assets/imgs/search_delete.webp"),
      new TabTitle('游戏', 'assets/imgs/ic_back_cancel.webp'),
      new TabTitle('我的', "assets/imgs/search_delete.webp"),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("首页"),
      //   backgroundColor: Color(0xffd43d3d),
      // ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: TabBarView(
                physics: NeverScrollableScrollPhysics(),
                controller: mController, children: [
              HomePage(),
              WrapWidget(),
              SecondPage(),
            ]
                // tabList.map((item) {
                //   return Stack(children: <Widget>[
                //     // Align(alignment:Alignment.topCenter,child: Text(item.title),),
                //     Align(alignment:Alignment.topCenter,child: LoginPage()),
                //     Align(alignment:Alignment.topCenter,child: SecondPage()),
                //   ],);
                // }).toList(),
                ),
          ),
          Container(
            color: new Color(0xFFFFFFFF),
            height: 54.0,
            child: TabBar(
              isScrollable: false,
              //是否可以滚动
              controller: mController,
              labelColor: Color(0xFFFF8000),
              indicatorColor:  Colors.white,
              unselectedLabelColor: Color(0xff666666),
              labelStyle: TextStyle(fontSize: 16.0),
              tabs:[
                TabBottom(
                  index: 0,
                  title: "首页",
                  iconName: "tab_home_uncheck.png",
                  activeIconName: "tab_home_click.png",
                  selectAble: selectAbles[0],
                ),
                TabBottom(
                  index: 1,
                  title: "游戏",
                  iconName: "tab_game_uncheck.png",
                  activeIconName: "tab_game_click.png",
                  selectAble: selectAbles[1],
                ),
                TabBottom(
                  index: 2,
                  title: "我的",
                  iconName: "tab_mine_uncheck.png",
                  activeIconName: "tab_mine_click.png",
                  selectAble: selectAbles[2],
                ),
              ],


              // tabList.map((item) {
              //   return Tab(
              //     // text: item.title,
              //     child:
              //     new Row(children: [
              //       Image.asset(
              //         item.iconPath,
              //         width: ScreenUtil().setWidth(20),
              //         height: ScreenUtil().setHeight(20),
              //       ),
              //       new Padding(
              //           padding: EdgeInsets.only(left: ScreenUtil().setHeight(10)),
              //       child: Text(item.title,
              //           style: TextStyle(
              //               color: Color(0xFFFF8000),
              //               fontSize: 12,
              //               letterSpacing: 1,
              //               fontWeight: FontWeight.w600,
              //               decoration: TextDecoration.none)),),
              //     ],),
              //   );
              // }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
