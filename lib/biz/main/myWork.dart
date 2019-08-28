import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MyWorkWidget extends StatefulWidget {
  List tips = ["监狱通知", "未查看日程", "未查看会议"];

  @override
  State<StatefulWidget> createState() {
    return MyWorkState();
  }
}

class MyWorkState extends State<MyWorkWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: Colors.white,
        border: Border.all(
          color: Colors.white,
          width: 2,
        ),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 10),
        ],
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Container(
        padding: EdgeInsets.fromLTRB(0, 19, 0, 14),
        child: Stack(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Container(
                  width: 100,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Text(
                        widget.tips[0],
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 14),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 12, 0, 0),
                        child: Text(
                          "99+",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 28, color: Colors.orangeAccent),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  width: 100,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Text(
                        widget.tips[1],
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 14),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 12, 0, 0),
                        child: Text(
                          "0",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 28, color: Colors.orangeAccent),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  width: 100,
                  child: GestureDetector(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Text(
                          widget.tips[2],
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 14),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 12, 0, 0),
                          child: Text(
                            "20",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 28, color: Colors.orangeAccent),
                          ),
                        ),
                      ],
                    ),
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
