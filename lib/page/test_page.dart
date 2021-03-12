import 'dart:async';

import 'package:FlutterTest/page/home_page.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_test_plugin/test_plugin.dart';

class TestPage extends StatefulWidget {
  var showColor = Colors.red;
  var showText = "请点击按钮";
  var _platformVersion = "unknown";

  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2), initPlatformState);
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
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(widget._platformVersion),
          leading: GestureDetector(
            child: Icon(Icons.arrow_back),
            onTap: _backClick,
          ),
        ),
        body: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  onPressed: () {
                    _btnClickEvent("点击红色按钮", Colors.red);
                  },
                  color: Colors.red,
                  child: Text('红色按钮'),
                ),
                Flexible(
                  flex: 1,
                  child: RaisedButton(
                    onPressed: () {
                      _btnClickEvent("点击黄色按钮", Colors.yellow);
                    },
                    color: Colors.yellow,
                    child: Text('黄色按钮'),
                  ),
                ),
                RaisedButton(
                  onPressed: () {
                    _btnClickEvent("点击绿色按钮", Colors.green);
                  },
                  color: Colors.green,
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
