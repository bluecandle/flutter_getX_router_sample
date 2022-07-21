import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sample_route_manage/src/controller/count_controller_with_getx.dart';

class WithGetX extends StatelessWidget {
  WithGetX({Key? key}) : super(key: key);

  // 이런식으로도 사용 가능.
  // 이런식으로 사용하면 find 할 필요도 없음.
  CountControllerWithGetX _controllerWithGetX =
      Get.put(CountControllerWithGetX());

  Widget _button(String id) {
    return RaisedButton(
        child: Text(
          '+',
          style: TextStyle(fontSize: 30),
        ),
        onPressed: () {
          // controller 찾기 > provider 는 context 로부터 찾았는데
          // GetX 는 그냥 find
          // 이런 방식의 장점?? context 가 필요없으니, 이 버튼을 별도의 다른 함수로 빼어놓아서 사용 가능.
          _controllerWithGetX.increase(id);
        });
  }

  @override
  Widget build(BuildContext context) {
    // Get.put(CountControllerWithGetX());
    return Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text(
          "GetX",
          style: TextStyle(fontSize: 50),
        ),
        // CountControllerWithGetX 라는 컨트롤러를 모니터링 하겠다는 의미.
        // 이렇게 지정을 해놓으니 밑에 controller 가 의미하는 것이 결국 CountControllerWithGetX 가 되는거고.
        // 그래서 controller.count 라는 형태로 참조가 가능해지는 것.

        // 그리고, 이렇게 여러 개를 놓을때 id 를 부여해서 통제가 가능!
        GetBuilder<CountControllerWithGetX>(
            id: 'first',
            builder: (controller) {
              return Text(
                "${controller.count}",
                style: TextStyle(fontSize: 50),
              );
            }),
        GetBuilder<CountControllerWithGetX>(
            id: 'second',
            builder: (controller) {
              return Text(
                "${controller.count}",
                style: TextStyle(fontSize: 50),
              );
            }),
        _button('first'),
        _button('second')
      ]),
    );
  }
}
