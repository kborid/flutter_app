import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OverlayWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _OverlayWidgetState();
}

class _OverlayWidgetState extends State<OverlayWidget> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      width: 100,
      top: 100,
      height: 45,
      child: ElevatedButton(
        onPressed: () {
          print('我被点击了');
        },
        child: Text('点我'),
      ),
    );
  }
}
