import 'dart:async';

import 'package:FlutterTest/test/test_provider_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:FlutterTest/page/homePage.dart';
import 'package:http/http.dart' as http;

class SplashPage extends StatefulWidget {
  @override
  State createState() => SplashState();
}

class SplashState extends State<SplashPage> {
  static const time = const Duration(seconds: 2);
  Timer timer;

  startNextPageTimer() {
    print("startNextpageTimer()");
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (BuildContext context) => HomePage()),
        (Route route) => route == null);
  }

  @override
  void initState() {
    super.initState();
    if (null == timer) timer = Timer(time, startNextPageTimer);
    loadData();
  }

  @override
  void dispose() {
    super.dispose();
    if (null != timer) timer.cancel();
  }

  loadData() async {
    String dataURL = "https://jsonplaceholder.typicode.com/posts";
    http.Response response = await http.get(dataURL);
    print(response.body);
  }

  @override
  Widget build(BuildContext context) {
    print(">>>>> value = ${Provider.of<TestModel>(context).value}");

    return MaterialApp(
      home: Scaffold(
        body: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Image.asset(
              "images/login_bg.png",
              fit: BoxFit.cover,
            ),
            Column(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(
                    top: 100,
                  ),
                  child: Image.asset(
                    "images/login_logo.png",
                    fit: BoxFit.cover,
                    height: 100,
                    width: 100,
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(30),
                  child: Image.asset(
                    "images/login_text.png",
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
