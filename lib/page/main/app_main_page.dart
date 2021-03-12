import 'package:FlutterTest/widget/comm_widget_main_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';

import 'quick_app_widget.dart';

class AppMainPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => AppMainState();
}

class AppMainState extends State<AppMainPage> {
  // Flutter团队开发的图片选择器（`image_picker`）插件。
  // 适用于iOS和Android的Flutter插件，用于从图像库中拾取图像，并使用相机拍摄新照片。
  // https://pub.dartlang.org/packages/image_picker
  getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    print(image);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          CommMainTitleWidget("应用中心"),
          QuickAppWidget(),
        ],
      ),
    );
  }
}
