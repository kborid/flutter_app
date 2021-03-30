import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_kborid_module/main.dart';
import 'package:kborid_flutter/page/test_page.dart';

void main() {
  runZonedGuarded(() {
    runApp(MyApp());
  }, (error, stacktrace) {
    print("occur error~~~ in runZonedGuarded()----\n$stacktrace");
  });
}

class MyApp1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TestPage(),
    );
  }
}
