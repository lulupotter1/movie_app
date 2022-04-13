import 'package:json_annotation/json_annotation.dart';

part 'movie_object_res.g.dart';

@JsonSerializable()
class MovieObjectRes {
  String? poster_path;
  bool? adult;
  String overview;
  String? release_date;
  List<int> genre_ids;
  int id;
  String original_title;
  String original_language;
  String title;
  String? backdrop_path;
  num popularity;
  int vote_count;
  bool video;
  num vote_average;

  MovieObjectRes({
    this.poster_path,
    required this.adult,
    required this.overview,
    this.release_date,
    required this.genre_ids,
    required this.id,
    required this.original_title,
    required this.original_language,
    required this.title,
    this.backdrop_path,
    required this.popularity,
    required this.vote_count,
    required this.video,
    required this.vote_average,
  });

  factory MovieObjectRes.fromJson(Map<String, dynamic> json) =>
      _$MovieObjectResFromJson(json);

  Map<String, dynamic> toJson() => _$MovieObjectResToJson(this);
}
