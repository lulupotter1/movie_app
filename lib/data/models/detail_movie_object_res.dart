import 'package:json_annotation/json_annotation.dart';
import 'package:movie_app/data/models/production_companies_object_res.dart';

part 'detail_movie_object_res.g.dart';

@JsonSerializable()
class DetailMovieObjectRes {
  String? poster_path;
  bool adult;
  String overview;
  String release_date;
  num budget;
  List<Map<String, dynamic>> genres;
  int id;
  String original_title;
  String original_language;
  String title;
  String? backdrop_path;
  num popularity;
  int vote_count;
  bool video;
  num vote_average;
  num revenue;
  List<ProductionCompaniesObjectRes> production_companies;

  DetailMovieObjectRes({
    this.poster_path,
    required this.adult,
    required this.overview,
    required this.release_date,
    required this.genres,
    required this.id,
    required this.original_title,
    required this.original_language,
    required this.title,
    this.backdrop_path,
    required this.popularity,
    required this.vote_count,
    required this.video,
    required this.vote_average,
    required this.budget,
    required this.revenue,
    required this.production_companies,
  });

  factory DetailMovieObjectRes.fromJson(Map<String, dynamic> json) =>
      _$DetailMovieObjectResFromJson(json);

  Map<String, dynamic> toJson() => _$DetailMovieObjectResToJson(this);
}
