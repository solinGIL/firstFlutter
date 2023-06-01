// 파일을 복사하는 함수를 작성하시오
// 원본 파일 경로와 복사할 파일 경로는 프로그램 실행시 파라미터로 전달되는 것으로 하고, 버퍼링이나 에러 처리는 하지 않는다.

import 'dart:io';

void main() {

  copy('newFile.txt', 'copyFile.txt'); // copy로 원본 파일과 복사할 파일을 인자로 보냄.
  print(File('copyFile.txt').readAsStringSync()); // 카피파일 문자열로 읽어줌.

}

void copy(String source, String target) {

  // 원본 파일에서 읽기
  final sourceFile = File(source);
  final text = sourceFile.readAsStringSync();

  // 복사할 파일에 쓰기
  final targetFile = File(target);
  targetFile.writeAsStringSync(text);
}