import 'package:flutter/cupertino.dart';

class CustomWidget extends StatefulWidget {
  var text;

  @override
  State createState() => CustomWidgetState();

  CustomWidget(var text) {
    this.text = text;
  }
}

class CustomWidgetState extends State<CustomWidget> {
  void _handleTap() {}

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTap,
      child: Center(
        child: Text(widget.text.toString()),
      ),
    );
  }
}
