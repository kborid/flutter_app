import 'dart:io';

import 'package:flutter/material.dart';

import '../plugin/tt_plugin.dart';

class HybridMainPage extends StatefulWidget {
  var isMain = false;
  final prefix = Platform.isAndroid ? "Android:" : "iOS:";

  @override
  _HybridMainPageState createState() => _HybridMainPageState();

  HybridMainPage(var isMain) {
    this.isMain = isMain;
  }
}

class _HybridMainPageState extends State<HybridMainPage> {
  var platform = 'unknow';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: _buildAppBarWidget(),
        body: Container(
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  '我是Flutter TT',
                  style: TextStyle(fontSize: 40),
                ),
                GestureDetector(
                  child: FlutterLogo(
                    size: 50,
                  ),
                  onTap: _tap,
                ),
                Text(
                  _buildOSVersion(platform),
                  style: TextStyle(fontSize: 50),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _buildOSVersion(var v) {
    return widget.prefix + v;
  }

  _buildAppBarWidget() {
    return widget.isMain
        ? AppBar(
            title: Text("TT"),
            centerTitle: true,
          )
        : null;
  }

  _tap() {
    TtPlugin.test;
    TtPlugin.platformVersion.then((ret) {
      print("ret = ${ret}");
      print("out setState platform = ${platform}");
      setState(() {
        platform = ret;
        print("in setState platform = ${platform}");
      });
    });
  }
}
