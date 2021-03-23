import 'package:kborid_flutter/pojo/user_info.dart';
import 'package:flutter/material.dart';

class UserInfoListWidget extends StatefulWidget {
  final UserInfo _userInfo;

  UserInfoListWidget(this._userInfo);

  @override
  _UserInfoListWidgetState createState() => _UserInfoListWidgetState();
}

class _UserInfoListWidgetState extends State<UserInfoListWidget> {
  var _bind = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(15),
              child: Text(
                "真实姓名",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(15),
              child: Text(
                widget._userInfo.name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 16, color: Colors.black26),
              ),
            ),
          ],
        ),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(15),
              child: Text(
                "证件类型",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(15),
              child: Text(
                widget._userInfo.loginId,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 16, color: Colors.black26),
              ),
            ),
          ],
        ),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(15),
              child: Text(
                "证件号码",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(15),
              child: Text(
                widget._userInfo.company,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 16, color: Colors.black26),
              ),
            ),
          ],
        ),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(15),
              child: Text(
                "联系电话",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(15),
              child: Text(
                widget._userInfo.sex,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 16, color: Colors.black26),
              ),
            ),
          ],
        ),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(15),
              child: Text(
                "电子邮箱",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(15),
              child: Text(
                widget._userInfo.phone,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 16, color: Colors.black26),
              ),
            ),
          ],
        ),
        Center(
          child: CheckboxListTile(
            value: _bind,
            onChanged: (bool) {
              setState(() {
                _bind = bool;
              });
            },
            title: Text('微信绑定'),
          ),
        ),
      ],
    );
  }
}
