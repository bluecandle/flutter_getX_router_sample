import 'package:flutter/material.dart';

class CountControllerWithProvider extends ChangeNotifier {
  int count = 0;
  void increase() {
    count++;
    notifyListeners(); // 이걸로 업데이트 하는거.
  }
}
