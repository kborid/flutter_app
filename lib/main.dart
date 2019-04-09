import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter'),
          centerTitle: true,
        ),
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Container(
              height: 100,
              color: Colors.cyan,
              child: CustomWidget(),
            ),
            Container(
              color: Colors.amberAccent,
              child: Row(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Center(
                        child: Text("Title"),
                      ),
                      Center(
                        child: Text("summary"),
                      )
                    ]
                  ),
                  Padding(
                    child: Icon(Icons.access_alarm, size: 15),
                    padding: EdgeInsets.all(10),
                  ),
                  Text("100")
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CustomWidget extends StatefulWidget {

  @override
  State createState() => CustomWidgetState();
}

class CustomWidgetState extends State<CustomWidget> {

  bool isPress = false;

  void _handleTap() {
    setState(() {
      isPress = !isPress;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: _handleTap,
      child: Center(
        child: Text(isPress ? "Hello" : "Welcome"),
      ),
    );
  }
}
