import 'package:kborid_flutter/const/const.dart';
import 'package:kborid_flutter/page/main/app_main_page.dart';
import 'package:kborid_flutter/page/user/user_main_page.dart';
import 'package:kborid_flutter/pojo/user_info.dart';
import 'package:kborid_flutter/widget/custom_page.dart';
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
    return Scaffold(
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
              label: Const.titles[0],
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.phonelink),
              label: Const.titles[1],
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.apps),
              label: Const.titles[2],
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: Const.titles[3],
            ),
          ]),
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
