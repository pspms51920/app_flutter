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
      floatingActionButton: new FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        child: new Icon(Icons.replay),
      ),
    );
  }
}