import 'package:flutter/material.dart';

import 'biz/main/appMain.dart';
import 'biz/pojo/userInfo.dart';
import 'biz/user/userMain.dart';
import 'const/Const.dart';
import 'widget/custom.dart';

class MainWidget extends StatefulWidget {
  @override
  State createState() => CustomAppState();
}

class CustomAppState extends State<MainWidget> {
  int _currentIndex = 2;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(Const.titles[_currentIndex]),
          centerTitle: true,
        ),
        body: _switchWidget(_currentIndex),
        bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: _currentIndex,
            iconSize: 20,
            selectedFontSize: 12,
            unselectedFontSize: 10,
            onTap: _onTap,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.message),
                title: Text(Const.titles[0]),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.schedule),
                title: Text(Const.titles[1]),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                title: Text(Const.titles[2]),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.contact_phone),
                title: Text(Const.titles[3]),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                title: Text(Const.titles[4]),
              ),
            ]),
      ),
      theme: ThemeData(),
    );
  }

  void _onTap(int value) {
    setState(() {
      _currentIndex = value;
    });
  }

  Widget _switchWidget(int index) {
    Widget widget;
    switch (index) {
      case 2:
        widget = AppMainWidget();
        break;
      case 4:
        widget = UserMainWidget(
            new UserInfo("测试者", "testId", "测试单位", "男", "1234567890"));
        break;
      default:
        widget = CustomWidget(Const.titles[_currentIndex]);
        break;
    }
    return widget;
  }
}
