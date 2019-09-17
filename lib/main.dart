import 'package:FlutterTest/model/test_provider_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:FlutterTest/page/splash.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
//        body: Provider<String>.value(
//          value: "Hello Word! Flutter",
//          child: SplashWidget(),
//        ),
        body: ChangeNotifierProvider<TestModel>(
          builder: (context) => TestModel(100),
          child: SplashWidget(),
        ),
      ),
    );
  }
}

class test {
  main(List<String> args) {}
}
