import 'package:get/get.dart';

enum NUM { FIRST, SECOND }

class User {
  String name;
  int age;

  User({required this.name, required this.age});
}

// extends 해서 GetX controller 상속하지 않고, 하나 하나에 observer 등록
class CountControllerWithReactive extends GetxController {
  //  .obs > observable?? 이렇게 지정했기 때문에, 변수형이 RxInt 가 된거임.
  RxInt count = 0.obs;

  Rx<NUM> nums = NUM.FIRST.obs;

  Rx<User> users = User(name: "adsf", age: 19).obs;

  RxList<String> list = [''].obs;

  // RxDouble
  // RxString

  // observable 로 지정하고, RxInt 로 지정했기 때문에, 아래 함수 하나로 그냥 반응형 상태관리가 되는 것임.
  void increase() {
    count++;

    nums(NUM.SECOND);
    users(User(age: 1, name: 'update'));
    users.update((_user) {
      _user?.name = 'partial update';
    });

    list.addAll(['addAll']);
    list.add('add');
    list.addIf(users.value.name == 'asdf ', 'addIf');
  }

  void putNumber(int value) {
    // 이렇게 그냥 변경하면 안됨!)
    // count = value;

    // observable 이라서 이런식으로 해줘야함.
    count(value);
  }

  @override
  void onInit() {
    // 근데 count 값이 RxInt 로 등록되어야만 ever() 에서 사용할 수 있음.
    // 반응형 GetX 변수를 위한 함수.
    ever(count, (_) => print('매번 호출'));
    once(count, (_) => print('한 번만 호출'));
    debounce(count, (_) => print('마지막 변경에 한 번만 호출.'),
        time: Duration(seconds: 1));
    // 검색쪽에서 사용 가능함
    interval(count, (_) => print('변경되고 있는 동안 1초마다 호출'),
        time: Duration(seconds: 1));
    super.onInit();
  }
}
