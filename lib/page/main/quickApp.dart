import 'package:FlutterTest/pojo/quickAppInfo.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class QuickAppWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return QuickAppState();
  }
}

class QuickAppState extends State<QuickAppWidget> {
  List<QuickAppInfo> apps = [
    QuickAppInfo("测试应用1"),
    QuickAppInfo("测试应用2"),
    QuickAppInfo("测试应用3"),
    QuickAppInfo("测试应用4"),
  ];

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 1.0,
        ),
        itemCount: apps.length,
        itemBuilder: (context, index) {
          return _buildItemWidget(context, apps[index]);
        },
      ),
    );
  }
}

_buildItemWidget(context, app) {
  return GestureDetector(
    onTap: _changeScreen(context, app),
    child: Container(
      child: Column(
        children: <Widget>[
          Center(
            child: Padding(
              padding: EdgeInsets.all(10),
              child: ClipOval(
                child: Image.network(
                  app.iconUrl,
                  fit: BoxFit.cover,
                  width: 70,
                  height: 70,
                ),
              ),
            ),
          ),
          Center(
            child: Text(app.name),
          )
        ],
      ),
    ),
  );
}

_changeScreen(context, app) {
  print(app.toString());
//    Navigator.push(context,
//        MaterialPageRoute(builder: (BuildContext context) => WebViewPage()));
}
