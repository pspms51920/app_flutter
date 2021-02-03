import 'package:app_flutter/pages/setting_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class SecondPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
          title: new Text('新页面')
      ),
      body: new PageView.custom(
        childrenDelegate: new SliverChildBuilderDelegate(
              (context, index) {
            return new Center(
              child: new Text('$index', style: new TextStyle(fontSize: 64.0)),
            );
          },
          childCount: 3,
        ),
      ),
      floatingActionButton: RaisedButton(
        onPressed: () {
          // Navigator.of(context).pop();
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => SettingPage()));
        },
        color: Colors.orange,
        child: Text(
          "设置",
          style: TextStyle(
              color: Colors.white,
              fontSize: 17,
              fontFamily: 'PingFang',
              letterSpacing: 1,
              fontWeight: FontWeight.w600,
              decoration: TextDecoration.none),
        ),
      ),
    );
  }
}