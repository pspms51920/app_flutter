import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class GamePage extends StatefulWidget {

  GamePage({Key key, this.title}) : super(key: key);

  final String title;


  @override
  GamePageStateView createState() => new GamePageStateView();
}


class GamePageStateView extends State<GamePage> {

  @override
  void initState() {
    super.initState();
    // 强制横屏
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight
    ]);
  }

  @override
  void dispose() {
    super.dispose();
    // 强制竖屏
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown
    ]);
  }



  @override
  Widget build(BuildContext context) {

    Widget networkDialog = new ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: new Container(
        width: 250,
        height: 90,
        color: Color(0XA3000000),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: (){
                Navigator.of(context).pop();
              },
              child: Image.asset(
                "assets/imgs/close.png",
                width: 31,
                height: 31,
              ),
            ),
          new Padding(padding: EdgeInsets.only(top: 10),
          child: Text(
            "您的网络开小差了哦，请检查网络~",
            style: TextStyle(
              color: Color(0XFFFFFFFF),
              fontSize: 13.0,
            ),
          ),),
        ],),
      ),
    );


    return new Scaffold(
      body: new Stack(
        alignment: Alignment.center,
        children: [
          Image.asset("assets/imgs/backback.png",
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.fill),

          networkDialog,
        ],
      ),
    );
  }
}