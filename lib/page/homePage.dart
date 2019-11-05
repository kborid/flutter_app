import 'package:FlutterTest/const/Const.dart';
import 'package:FlutterTest/page/main/appMainPage.dart';
import 'package:FlutterTest/page/user/userMainPage.dart';
import 'package:FlutterTest/pojo/userInfo.dart';
import 'package:FlutterTest/widget/CustomPage.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State createState() => CustomAppState();
}

class CustomAppState extends State<HomePage> {
  AppMainPage _appMainPage;
  UserMainPage _userMainPage;

  int _currentIndex = 2;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
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
                icon: Icon(Icons.public),
                title: Text(Const.titles[0]),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.phonelink),
                title: Text(Const.titles[1]),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.apps),
                title: Text(Const.titles[2]),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                title: Text(Const.titles[3]),
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
    switch (index) {
      case 2:
        if (null == _appMainPage) {
          _appMainPage = AppMainPage();
        }
        return _appMainPage;
      case 3:
        if (null == _userMainPage) {
          _userMainPage = UserMainPage(
              new UserInfo("测试", "test", "测试单位", "男", "1234567890"));
        }
        return _userMainPage;
      default:
        return CustomPage(Const.titles[_currentIndex]);
    }
  }
}
