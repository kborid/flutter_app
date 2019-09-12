import 'package:FlutterTest/biz/pojo/quickAppInfo.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class QuickAppWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return QuickAppState();
  }
}

class QuickAppState extends State<QuickAppWidget> {
  List<QuickAppInfo> apps = [];

  @override
  void initState() {
    super.initState();
    _retrieveIcons();
  }

  void _retrieveIcons() {
    Future.delayed(Duration(milliseconds: 200)).then((e) {
      setState(() {
        apps.addAll([
          QuickAppInfo("测试应用1"),
          QuickAppInfo("测试应用2"),
          QuickAppInfo("测试应用3"),
          QuickAppInfo("测试应用4"),
          QuickAppInfo("测试应用1"),
          QuickAppInfo("测试应用2"),
          QuickAppInfo("测试应用3"),
          QuickAppInfo("测试应用4"),
        ]);
      });
    });
  }

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
          return QuickAppItemWidget(apps[index]);
        },
      ),
    );
  }
}

class QuickAppItemWidget extends StatelessWidget {
  final QuickAppInfo _quickAppInfo;

  QuickAppItemWidget(this._quickAppInfo);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        onTap: _changeScreen(),
        child: Column(
          children: <Widget>[
            Center(
              child: Padding(
                padding: EdgeInsets.all(10),
                child: ClipOval(
                  child: Image.network(
                    _quickAppInfo.iconUrl,
                    fit: BoxFit.cover,
                    width: 70,
                    height: 70,
                  ),
                ),
              ),
            ),
            Center(
              child: Text(_quickAppInfo.name),
            )
          ],
        ),
      ),
    );
  }

  _changeScreen() {
    print(_quickAppInfo.toString());
  }
}
