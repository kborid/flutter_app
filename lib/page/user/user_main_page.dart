import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kborid_flutter/page/user/user_info_widget.dart';
import 'package:kborid_flutter/pojo/user_info.dart';

class UserMainPage extends StatefulWidget {
  final UserInfo _userInfo;

  UserMainPage(this._userInfo);

  @override
  State createState() => UserMainState();
}

class UserMainState extends State<UserMainPage> {
  final ImagePicker _picker = ImagePicker();
  var _path = '';

  // Flutter团队开发的图片选择器（`image_picker`）插件。
  // 适用于iOS和Android的Flutter插件，用于从图像库中拾取图像，并使用相机拍摄新照片。
  // https://pub.dartlang.org/packages/image_picker
  getImage() async {
    var image = await _picker.getImage(source: ImageSource.gallery);
    print('pick image path = ${image?.path}');
    setState(() {
      _path = image.path;
    });
  }

  @override
  void initState() {
    super.initState();
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
                        child: _path == '' ? Image.asset(
                          "assets/images/pic.png",
                          fit: BoxFit.cover,
                          width: 100,
                          height: 100,
                        ): Image.file(File.fromUri(Uri.parse(_path))),
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
          child: UserInfoListWidget(widget._userInfo),
          color: Colors.white,
        ),
      ],
    );
  }
}
