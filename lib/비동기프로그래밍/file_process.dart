// 1.sample.csv 파일을 읽어와서 “한석봉" 이라는 문자열이 있는지 찾고, 있다면 sample_copy.csv 파일에 “김석봉"으로 수정하는 함수를 작성하시오.
// (async - await 사용할 것)
// 2. 위 함수를 실행할 때 파일을 찾을 수 없는 경우 예외 처리를 수행하시오.

import 'dart:io';
import 'dart:async';

Future<void> findAndReplace(
    String source, String target, String find, String replace) async { // 원본파일 읽기, 교체, 쓰기 인자를 받을 녀석들

  // 파일에서 문자열을 읽습니다.
  final sourceText = await File(source).readAsString(); // main에서 읽을 파일을 인자로 보내면 여기서 source에 해당하는 파일을 찾아 읽어줌.

  // sourceText에서 find문자를 replace문자로 바꿈
  final targetText = sourceText.replaceAll(find, replace); //

  // targetText의 값을 받아서 taget파일에 씀
  await File(target).writeAsString(targetText);
}

void main() async {
  // 인자에 보냄 source = sample.csv | target = sample_copy.csv | find = 한석봉 | replace = 김석봉
  await findAndReplace('lib/비동기프로그래밍/sample.csv', 'lib/비동기프로그래밍/sample_copy.csv', '한석봉', '김석봉')
      .catchError((error) {
    print(error);
  });

  print(await File('sample_copy.csv').readAsString()); // 카피한 파일을 읽어줌.

}
