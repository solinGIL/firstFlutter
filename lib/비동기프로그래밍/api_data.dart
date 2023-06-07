//다음과 같은 영화 정보 Json 을 반환하는 함수가 있다. (async - await 사용할 것)
//위 함수를 사용하여 director 가 누군지 출력해 보시오
import 'dart:convert';

Future<String> getMovieInfo() async {
  await Future.delayed(Duration(seconds: 2));
  final mokData =  {
    'title' : 'Star Wars',
    'director' : 'George Lucas',
    'year' : 1977,
  };
  return jsonEncode(mokData);
}

void main() async {
  // 상수에 getMovieInfo를 그대로 가져오려 했으나 처음엔 여기가 async공간이 아니라고 할당이 안됨
  // 찾아보니 main에 async를 삽입해주면 여기서도 await을 사용해서 비동기 함수들을 가져올 수 있게됨.
  final String movieInfo = await getMovieInfo();
  Map<String, dynamic> movieData = jsonDecode(movieInfo); // 해독
  print('감독 : ${movieData['director']}'); // 결과 : George Lucas
}