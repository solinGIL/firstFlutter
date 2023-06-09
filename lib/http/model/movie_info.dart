class MovieInfo {
  MovieInfo({
   required this.id,
   required this.title,
   required this.overview
});

  late final int id;
  late final String title;
  late final String overview;

  MovieInfo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    overview = json['overview'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['title'] = title;
    _data['overview'] = overview;
    return _data;
  }
  
  @override
  String toString() {
    return 'MovieInfo{id: $id, title: $title, overview: $overview}';
  }
}