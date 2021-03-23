import 'dart:async';

import 'package:flutter/services.dart';

class TtPlugin {
  static const MethodChannel _channel = const MethodChannel('channel1');

  static Future<String> get platformVersion async {
    return await _channel.invokeMethod('getPlatformVersion');
  }

  static Future<bool> get test async {
    print('flutter test call~~');
    var platform = "QQ";
    var ret =
        await _channel.invokeMethod("checkInstalled", {"platform": platform});
    print('是否安装了$platform = $ret');
    return ret;
  }

  static testMethod() {
    return "testMethod";
  }

  @override
  noSuchMethod(Invocation invocation) {
    return super.noSuchMethod(invocation);
  }
}
