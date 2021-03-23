import 'dart:async';

import 'package:flutter/material.dart';
import 'package:kborid_flutter/page/test_page.dart';

void main() {
  runZonedGuarded(() {
    runApp(MyApp());
  }, (error, stacktrace) {
    print("occur error~~~ in runZonedGuarded()");
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TestPage(),
    );
  }
}
