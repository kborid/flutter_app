import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'home.dart';

class SplashWidget extends StatefulWidget {
  @override
  State createState() {
    return SplashState();
  }
}

class SplashState extends State<SplashWidget> {
  static const time = const Duration(seconds: 2);
  Timer timer;

  startNextPageTimer() {
    print("startNextpageTimer()");
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (BuildContext context) => MainWidget()),
        (Route route) => route == null);
  }

  @override
  void initState() {
    super.initState();
    if (null == timer) timer = Timer(time, startNextPageTimer);
  }

  @override
  void dispose() {
    super.dispose();
    if (null != timer) timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
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
