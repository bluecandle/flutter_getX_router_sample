# 강의 2 : 라우트 관리 기능

[링크](https://www.youtube.com/watch?v=OXfG-D4PNpQ)

강의 내용

- 기본 페이지 라우팅 ( 기존 Navigator 와 GetX route 차이 )
- Route 선언 (기존 방식과 GetX route 차이)
- Named 페이지 라우팅 ( 기존 Navigator 와 GetX route 차이 )
- 페이지 전환 효과 적용
- arguments 전달
- 동적 링크 사용

# 강의 3 : 단순 상태관리

[링크](https://www.youtube.com/watch?v=k3hgQu6it4c)

GetX에서 상태관리는 두 가지로 나뉜다.

- 단순 상태관리
    - 이게 기존 provider랑 비슷함.
- 반응형 상태관리

# 강의 4 : 반응형 상태관리
[링크](https://www.youtube.com/watch?v=TjC1ka8fZJw)

- obs, Obx
    - 반응형 상태관리는 GetX 에 종속적인 것은 아님! 그런데, 그냥 GetX 에서 해당 개념을 사용하는 것뿐임.
    - obs > observable
    - Obx
        - controller 에서 obs 로 선언한 observable 의 변화를 감지했을 때, 그 변화를 Obx 로 보내주는 구조.
        - 사용하게 되면, 반드시 obs 를 붙인 값을 사용해줘야함.
- Rx ~~ > Reactive + GetX 를 합친 것의 약자라고 보면 되는듯
    - RxDouble
    - RxString
    - RxInt
    - …
    - enum과 섞어서 쓰는 방법
        
        ```dart
        enum NUM { FIRST, SECOND }
        Rx<NUM> nums = NUM.FIRST.obs;
        ```
        
        - 다른 유형도 비슷하게 응용 가능할듯?
        
        ```dart
        // class
        
        User({required this.name, required this.age});
        
        Rx<User> users = User(name: "adsf", age: 19).obs;
        
        //통 업데이트
        users(User(age: 1, name: 'update'));
        
        //일부 업데이트
        users.update((_user) {
          _user?.name = 'partial update';
        });
        
        // list
        
        RxList<String> list = [''].obs;
        list.addAll(['addAll']);
        list.add('add');
        list.addIf(users.value.name == 'asdf ', 'addIf');
        ```
        
- 반응형 상태관리의 경우, 값에 변경이 있어야만 화면에 변화가 일어남.
    - 근데, 단순상태관리의 경우, 값에 변경이 없어도 화면에 업데이트가 일어남! (화면에 변화가 필요가 없는데 변화가 일어난다는거지)
    - **`요점` :** 반응형을 잘 사용하면, 리소스를 덜 사용하면서 상태관리가 가능해진다.
- 이벤트 트리거가 가능해짐.
    - GetxController 상속받아야함.
    - GetxController 에 lifecycle 이 있음.
    - 보통 onInit(), onClose() 만 사용하게 됨.
        - ever
            - 매번 값이 변경될 때마다
        - once
            - 한 번만 호출
        - debounce
            - 마지막 변경에 한 번만 호출.
            
            ```dart
            debounce(count, (_) => print('마지막 변경에 한 번만 호출.'),
                    time: Duration(seconds: 1));
            ```
            
            - 검색같은거 할 때, 한 번 입력 있을 때마다 계속 예상 검색 결과 받아오면 서버 부하가 엄청나니까, 마지막 변화가 있은 후에 n 초 지나고나서 이벤트 발생시키도록 하는 기능.
        - interval
            - 변경되고 있는 동안, n초마다 호출.

# 강의 5 종속성 관리 - 의존성 주입

[링크](https://www.youtube.com/watch?v=OXfG-D4PNpQ)

DI!

routing 단계에서 사용할 controller 를 주입해서 보내주기.

# 강의 6 종속성 관리 - 바인딩

[링크](https://www.youtube.com/watch?v=O1Bw-mwF9xc&list=PLgRxBCVPaZ_3bPtdyE0Tj-w1CFX01bgUE&index=6)

- 인스턴스화 시키고, 올라간 인스턴스를 사용하고, 사용하지 않을 때는 제거하고…
- main.dart (앱 시작할 때 설정들 수행되는 파일) 단계에서 페이지마다 binding 을 미리 지정해놓고, 이후에는 신경쓰지 않도록 만들 수 있다.

## 강의 7 : **GetxService 는 GetxController는 뭐가 다를까?**

[https://www.youtube.com/watch?v=hPLmNBDEnEk&list=PLgRxBCVPaZ_3bPtdyE0Tj-w1CFX01bgUE&index=7](https://www.youtube.com/watch?v=hPLmNBDEnEk&list=PLgRxBCVPaZ_3bPtdyE0Tj-w1CFX01bgUE&index=7)


### GetxService

- GetxController 에서 옵션을 지정해서 사용했던 것들을, 옵션 없이도 사용할 수 있다??
    - GetxController 에서 옵션 permanent : true 를 지정한 효과를 GetxService 를 통해 구현 가능.
- GetxService 를 쓰려면, GetxService 를 상송받으면 된다.
- `Get.reset()`
    - GetX 로 등록된 모든 것의 초기화.