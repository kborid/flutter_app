import 'package:flutter/material.dart';

class GridViewWidget extends StatefulWidget {
  @override
  _GridViewWidgetState createState() => _GridViewWidgetState();
}

class _GridViewWidgetState extends State<GridViewWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        shrinkWrap: true,
        // 排列方向，Axis.horizontal表示水平，Axis.vertical表示垂直
        scrollDirection: Axis.vertical,
        padding: const EdgeInsets.all(20.0),
        children: <Widget>[
          Center(child: Text("123"),),
          Divider(height: 1.0, color: Colors.grey),
          Center(child: Text("456"),),
          Divider(height: 1.0, color: Colors.grey),
          // todo: 建议控件多的话可以做一个封装
        ],
      ),
    );
  }
}
