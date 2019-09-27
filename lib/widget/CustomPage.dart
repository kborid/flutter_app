import 'package:flutter/cupertino.dart';

class CustomPage extends StatefulWidget {
  var text;

  @override
  State createState() => CustomWidgetState();

  CustomPage(var text) {
    this.text = text;
  }
}

class CustomWidgetState extends State<CustomPage> {
  void _handleTap() {}

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTap,
      child: Center(
        child: Text(widget.text),
      ),
    );
  }
}
