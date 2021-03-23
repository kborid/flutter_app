import 'dart:async';

import 'package:kborid_flutter/page/home_page.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

class TestPage extends StatefulWidget {
  var showColor = Colors.red;
  var showText = "请点击按钮";
  var _platformVersion = "unknown";

  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  static const url = "https://jsonplaceholder.typicode.com/posts";

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2), initPlatformState);
    loadData();
    loadDataDio();
  }

  loadData() async {
    var response = await http.Client().get(url);
    print(response.body.toString());
  }

  loadDataDio() async {
    var response = await new Dio().get(url);
    print(response.data.toString());
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    // TestPlugin.test;

    String platformVersion = 'unknow~~';
    // Platform messages may fail, so we use a try/catch PlatformException.
    // try {
    //   platformVersion = await /*FlutterTestPlugin.platformVersion*/ TestPlugin
    //       .platformVersion;
    // } on PlatformException {
    //   platformVersion = 'Failed to get platform version.';
    // }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      widget._platformVersion = platformVersion;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget._platformVersion),
        leading: TextButton(
          child: Icon(Icons.arrow_back),
          onPressed: _backClick,
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
                      widget.showText,
                      style: TextStyle(fontSize: 50, color: widget.showColor),
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
      widget.showText = text;
      widget.showColor = color;
    });
    Future.delayed(
        Duration(microseconds: 200),
        () => {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => HomePage()))
            });
  }

  _backClick() {
    print("back click");
  }
}
