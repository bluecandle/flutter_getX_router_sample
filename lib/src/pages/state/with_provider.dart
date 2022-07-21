import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample_route_manage/src/controller/count_controller_with_provider.dart';

class WithProvider extends StatelessWidget {
  const WithProvider({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text(
          "Provider",
          style: TextStyle(fontSize: 50),
        ),
        // provider 를 이용한 예시
        Consumer<CountControllerWithProvider>(builder: (_, snapshot, child) {
          return Text(
            "${snapshot.count}",
            style: TextStyle(fontSize: 50),
          );
        }),
        RaisedButton(
            child: Text(
              '+',
              style: TextStyle(fontSize: 30),
            ),
            onPressed: () {
              // listen: false 의 이유?? Consumer 가 있기 때문.
              // 버튼을 누르면 listen 을 하겠다고 하면 전체가 다시 빌드가 되기 때문에 충돌된다...?
              // 사실 잘 이해 안됨.

              // context 가 필요하기 때문에, 이 버튼을 함수화 하려면, WithProvider 자체를 Stateful로 변경하거나 context 를 넘겨줘야함.
              // 어쨌든 번거롭다!
              Provider.of<CountControllerWithProvider>(context, listen: false)
                  .increase();
            })
      ]),
    );
  }
}
