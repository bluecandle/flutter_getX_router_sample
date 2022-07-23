import 'package:get/get.dart';

class DependenceController extends GetxController {
  RxInt num = 0.obs;
  void increase() {
    num++;
  }
}
