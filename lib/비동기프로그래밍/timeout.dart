// Future.timeout(시간) 함수를 사용하면
// Future가 특정 시간안에 종료되지 않았을 때 타임아웃 처리를 할 수 있다
// 다음 Future 함수를 실행하고 5초 이내에 완료되지 않으면 “timeout”을 출력하시오.

import 'dart:async';

Future<String> timeoutFuture() async {
    await Future.delayed(Duration(seconds: 6));
    return 'ok';
}


void main() async {
  /* 공식문서에 있는 문법 그대로 작성..
     예외가 발생하면 on으로 전달..
     먼저 timeoutFuture() 함수가 실행.. 그 뒤에 timeout메서드를 호출..
     이 메서드는 Future가 지정된 시간내에 완료되지 않으면 TimeoutException을 발생시킴.
  */
    try {
      await timeoutFuture().timeout(const Duration(seconds: 5));
    } on TimeoutException {
      print('timeout');
    }
}