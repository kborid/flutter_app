import 'package:flutter/material.dart';

class CommTitleWidget extends StatelessWidget {
  var _title;
  var _statusBarHeight;

  CommTitleWidget(this._title);

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
          Container(
            width: 50,
            height: 50,
            child: GestureDetector(
              onTap: _right,
              child: Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
            ),
          ),
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
          Container(
            width: 50,
            height: 50,
            child: GestureDetector(
              onTap: _right,
              child: Icon(
                Icons.menu,
                color: Colors.white,
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
