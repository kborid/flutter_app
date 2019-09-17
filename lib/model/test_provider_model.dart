import 'package:flutter/material.dart';

class TestModel with ChangeNotifier {
  int value = 0;

  TestModel(this.value);

  increment() {
    value++;
    notifyListeners();
  }

  decrement() {
    value--;
    notifyListeners();
  }
}
