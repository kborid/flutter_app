import 'package:FlutterTest/biz/pojo/userInfo.dart';
import 'package:FlutterTest/biz/user/user_info_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class UserMainWidget extends StatefulWidget {
  final UserInfo _userInfo;

  UserMainWidget(this._userInfo);

  @override
  State createState() => UserMainState();
}

class UserMainState extends State<UserMainWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          color: Colors.blue[500],
          child: Stack(
            children: <Widget>[
              Center(
                child: Padding(
                  padding: EdgeInsets.all(80),
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
              Text(
                "石头",
                style: TextStyle(fontSize: 20, color: Colors.white),
              )
            ],
          ),
        ),
        Container(
          child: UserInfoListWidget(widget._userInfo),
          color: Colors.white,
        ),
      ],
    );
  }
}
