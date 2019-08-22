import 'package:flutter/material.dart';

import 'widget/custom.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  var titles = ["Homee", "Message", "Userr"];

  @override
  State createState() => CustomAppState();
}

class CustomAppState extends State<MyApp> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(widget.titles[_currentIndex]),
          centerTitle: true,
        ),
        body: CustomWidget(_currentIndex),
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: _currentIndex,
            onTap: _onTap,
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home), title: Text(widget.titles[0])),
              BottomNavigationBarItem(
                  icon: Icon(Icons.message), title: Text(widget.titles[1])),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person), title: Text(widget.titles[2]))
            ]),
      ),
    );
  }

  void _onTap(int value) {
    setState(() {
      _currentIndex = value;
    });
  }
}
