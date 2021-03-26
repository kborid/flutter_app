import 'package:kborid_flutter/page/webview_page.dart';
import 'package:kborid_flutter/pojo/quick_app_info.dart';
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
    QuickAppInfo("测试应用5"),
    QuickAppInfo("测试应用6"),
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
          return _buildItemWidget(apps[index]);
        },
      ),
    );
  }

  _buildItemWidget(app) {
    return GestureDetector(
      onTap: () {
        _changeScreen(app);
      },
      child: Column(
        children: <Widget>[
          Center(
            child: Padding(
              padding: EdgeInsets.all(10),
              child: DecoratedBox(
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  boxShadow: [
                    BoxShadow(color: Colors.grey[400], blurRadius: 30),
                  ],
                  borderRadius: BorderRadius.circular(50),
                ),
                child: ClipOval(
                  child: Image.asset(
                    'assets/images/pic.png',
                    fit: BoxFit.cover,
                    width: 70,
                    height: 70,
                  ),
                ),
              ),
            ),
          ),
          Center(
            child: Text(app.name),
          )
        ],
      ),
    );
  }

  _changeScreen(QuickAppInfo app) {
    print(app.toString());
    Navigator.push(context,
        MaterialPageRoute(builder: (BuildContext context) => WebViewPage(app.targetUrl, app.name)));
  }
}
