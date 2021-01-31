import 'package:flutter/material.dart';

/*
* 可以让子控件自动换行的控件
*
* */
class WrapWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10, //主轴上子控件的间距
      runSpacing: 5, //交叉轴上子控件之间的间距
      children: Boxs(), //要显示的子控件集合
    );
  }



  /*一个渐变颜色的正方形集合*/
  List<Widget> Boxs() => List.generate(10, (index) {
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
              Colors.orangeAccent,
              Colors.orange,
              Colors.deepOrange
            ]),
          ),
          child: Text(
            "${index}",
            style: TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      );
  });
}

