import 'dart:async';

import 'package:FlutterTest/page/test_page.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_kborid_package/flutter_kborid_package.dart';
import 'package:http/http.dart' as http;

class SplashPage extends StatefulWidget {
  @override
  State createState() => SplashState();
}

class SplashState extends State<SplashPage> {
  static const url = "https://jsonplaceholder.typicode.com/posts";
  static const time = const Duration(seconds: 2);
//  Timer timer;

  startNextPageTimer() {
    print("startNextpageTimer()");
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (BuildContext context) => TestPage()),
        (Route route) => route == null);
  }

  @override
  void initState() {
    super.initState();
//    if (null == timer) timer = Timer(time, startNextPageTimer);
    Future.delayed(time, startNextPageTimer);
//    loadData();
    loadDataDio();

    Calculator.addTwo(3);
    Calculator calculator = new Calculator();
    calculator.addOne(1);
  }

  @override
  void dispose() {
    super.dispose();
//    if (null != timer) timer.cancel();
  }

  loadData() async {
    var response = await http.Client().get(url);
    print(response.body.toString());
  }

  loadDataDio() async {
    var response = await new Dio().get(url);
//    print(response.toString());
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Stack(
          fit: StackFit.expand,
          children: [],
          // children: <Widget>[
          //   Image.asset(
          //     "images/ic_bg.png",
          //     fit: BoxFit.cover,
          //   ),
          //   Column(
          //     mainAxisSize: MainAxisSize.max,
          //     children: <Widget>[
          //       Container(
          //         margin: EdgeInsets.only(
          //           top: 100,
          //         ),
          //         child: Image.asset(
          //           "images/login_logo.png",
          //           fit: BoxFit.cover,
          //           height: 100,
          //           width: 100,
          //         ),
          //       ),
          //       Container(
          //         margin: EdgeInsets.all(30),
          //         child: Image.asset(
          //           "images/login_text.png",
          //           fit: BoxFit.cover,
          //         ),
          //       ),
          //     ],
          //   ),
          // ],
        ),
      ),
    );
  }
}
