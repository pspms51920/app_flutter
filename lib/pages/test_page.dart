import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class SecondPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
          title: new Text('新页面')
      ),
      body: new Center(
        child: new Text(
          '点击浮动按钮返回首页',
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        child: new Icon(Icons.replay),
      ),
    );
  }
}