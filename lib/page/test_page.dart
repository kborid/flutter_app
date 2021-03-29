import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_kborid_plugin/flutter_kborid_plugin.dart';
import 'package:kborid_flutter/page/home_page.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:kborid_flutter/widget/widget_overlay.dart';

class TestPage extends StatefulWidget {
  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  static const url = "https://jsonplaceholder.typicode.com/posts";

  var showColor = Colors.red;
  var showText = "请点击按钮";
  var _platformVersion = "--";

  @override
  void initState() {
    Future.delayed(Duration(seconds: 2), initPlatformState);
    _loadData();
    _loadDataDio();
    WidgetsBinding.instance.addPostFrameCallback(_buildCompleted);
    super.initState();
  }

  _buildCompleted(Duration timeStamp) {
    Overlay.of(context).insert(OverlayEntry(builder: (context) {
      return OverlayWidget();
    }));
    _printInfo();
  }

  _printInfo() {
    print('padding top ${MediaQuery.of(context).padding.top}');
    print('padding bottom ${MediaQuery.of(context).padding.bottom}');
  }

  _loadData() async {
    var response = await http.Client().get(Uri.parse(url));
    print(response.body.toString());
  }

  _loadDataDio() async {
    var response = await new Dio().get(url);
    print(response.data.toString());
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    // TestPlugin.test;

    String platformVersion = '~~~unknown~~';
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      platformVersion =
          await FlutterKboridPlugin.platformVersion;
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_platformVersion),
        leading: Container(
          child: ElevatedButton(
            onPressed: () {},
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.indigo)),
            child: Icon(Icons.arrow_back),
          ),
        ),
      ),
      body: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//              crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                onPressed: () {
                  _btnClickEvent("点击红色按钮", Colors.red);
                },
                style: ButtonStyle(
                    textStyle:
                        MaterialStateProperty.all(TextStyle(fontSize: 20)),
                    backgroundColor: MaterialStateProperty.all(Colors.red)),
                child: Text('红色按钮'),
              ),
              Flexible(
                flex: 1,
                child: ElevatedButton(
                  onPressed: () {
                    _btnClickEvent("点击黄色按钮", Colors.yellow);
                  },
                  style: ButtonStyle(
                      textStyle:
                          MaterialStateProperty.all(TextStyle(fontSize: 20)),
                      backgroundColor:
                          MaterialStateProperty.all(Colors.yellow)),
                  child: Text('黄色按钮'),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  _btnClickEvent("点击绿色按钮", Colors.green);
                },
                style: ButtonStyle(
                    textStyle:
                        MaterialStateProperty.all(TextStyle(fontSize: 20)),
                    backgroundColor: MaterialStateProperty.all(Colors.green)),
                child: Text('绿色按钮'),
              ),
            ],
          ),
          Expanded(
            child: Column(
              children: <Widget>[
                Container(
                  height: 150,
                  child: Center(
                    child: Text(
                      showText,
                      style: TextStyle(fontSize: 50, color: showColor),
                    ),
                  ),
                ),
                FlutterLogo(
                  size: 60,
                  curve: Curves.elasticInOut,
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  _btnClickEvent(text, color) {
    setState(() {
      showText = text;
      showColor = color;
    });
    Future.delayed(
        Duration(microseconds: 200),
        () => {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => HomePage()))
            });
  }
}
