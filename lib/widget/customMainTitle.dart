import 'package:flutter/material.dart';

class CommMainTitleWidget extends StatelessWidget {
  var _title;
  var _statusBarHeight;

  CommMainTitleWidget(this._title);

  @override
  Widget build(BuildContext context) {
    _statusBarHeight = MediaQuery.of(context).padding.top;

    return Container(
      padding: EdgeInsets.fromLTRB(0, _statusBarHeight, 0, 0),
      color: Colors.blue[400],
      height: 80,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            child: Container(
              child: Text(
                _title,
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }

  _back() {
    print('back');
  }

  _right() {
    print('right');
  }
}
