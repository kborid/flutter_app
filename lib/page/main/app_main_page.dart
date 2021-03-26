import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:kborid_flutter/widget/comm_widget_main_title.dart';

import 'quick_app_widget.dart';

class AppMainPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AppMainState();
}

class _AppMainState extends State<AppMainPage> {

  @override
  void initState() {
    super.initState();
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
