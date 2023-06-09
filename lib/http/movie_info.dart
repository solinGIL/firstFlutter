import 'dart:convert';
import 'package:http/http.dart' as http;
import 'model/movie_info.dart';

void main() async {
  // 영화 정보를 가져옴
 // final movieInfos = await getMovieInfos();
 // movieInfos.forEach((movieInfo) => print(jsonEncode(movieInfo.toJson())));

  // 영화의 상세정보를 가져옴
  final movieInfo = await getMovieSangse(569094);
  print(jsonEncode(movieInfo.toJson()));
}

// 영화 정보를 json으로 가져오는 함수
Future<List<MovieInfo>> getMovieInfos() async {
  final response = await http.get(Uri.parse(
      'https://api.themoviedb.org/3/movie'
          '/upcoming?api_key=a64533e7ece6c72731da47c9c8bc691f&language=ko-KR&page=1'));

  var jsonData = jsonDecode(response.body);
  List<dynamic> results = jsonData['results'];
  return results.map((json) => MovieInfo.fromJson(json)).toList();
}


// 영화의 상세 정보를 가져오는 함수
Future<MovieInfo> getMovieSangse(int movieId) async {
  // movieId를 인자로 받아와서 $movieId에 들어감. 해당 넘버에 맞는 영화 내용이 출력됨.
  final response = await http.get(
      Uri.parse('https://api.themoviedb.org/3/movie'
          '/$movieId?api_key=a64533e7ece6c72731da47c9c8bc691f&language=ko-KR&page=1'));

  var jsonData = jsonDecode(response.body);
  return MovieInfo.fromJson(jsonData);
}
