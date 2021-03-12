import 'package:FlutterTest/page/user/user_info_widget.dart';
import 'package:FlutterTest/pojo/user_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class UserMainPage extends StatefulWidget {
  final UserInfo _userInfo;

  UserMainPage(this._userInfo);

  @override
  State createState() => UserMainState();
}

class UserMainState extends State<UserMainPage> {
  UserInfoListWidget _userInfoListWidget;

  @override
  void initState() {
    super.initState();
    _userInfoListWidget = UserInfoListWidget(widget._userInfo);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          color: Colors.blue,
          child: Padding(
            padding: EdgeInsets.all(35),
            child: Column(
              children: <Widget>[
                Center(
                  child: Padding(
                    padding: EdgeInsets.all(30),
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        boxShadow: [
                          BoxShadow(color: Colors.blue[800], blurRadius: 30),
                        ],
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: ClipOval(
                        child: Image.network(
                          "http://pic32.nipic.com/20130813/3347542_160503703000_2.jpg",
                          fit: BoxFit.cover,
                          width: 100,
                          height: 100,
                        ),
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    widget._userInfo.name,
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          child: _userInfoListWidget,
          color: Colors.white,
        ),
      ],
    );
  }
}
