// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail_movie_object_res.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DetailMovieObjectRes _$DetailMovieObjectResFromJson(
        Map<String, dynamic> json) =>
    DetailMovieObjectRes(
      poster_path: json['poster_path'] as String?,
      adult: json['adult'] as bool,
      overview: json['overview'] as String,
      release_date: json['release_date'] as String,
      genres: (json['genres'] as List<dynamic>)
          .map((e) => e as Map<String, dynamic>)
          .toList(),
      id: json['id'] as int,
      original_title: json['original_title'] as String,
      original_language: json['original_language'] as String,
      title: json['title'] as String,
      backdrop_path: json['backdrop_path'] as String?,
      popularity: json['popularity'] as num,
      vote_count: json['vote_count'] as int,
      video: json['video'] as bool,
      vote_average: json['vote_average'] as num,
      budget: json['budget'] as num,
      revenue: json['revenue'] as num,
      production_companies: (json['production_companies'] as List<dynamic>)
          .map((e) =>
              ProductionCompaniesObjectRes.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DetailMovieObjectResToJson(
        DetailMovieObjectRes instance) =>
    <String, dynamic>{
      'poster_path': instance.poster_path,
      'adult': instance.adult,
      'overview': instance.overview,
      'release_date': instance.release_date,
      'budget': instance.budget,
      'genres': instance.genres,
      'id': instance.id,
      'original_title': instance.original_title,
      'original_language': instance.original_language,
      'title': instance.title,
      'backdrop_path': instance.backdrop_path,
      'popularity': instance.popularity,
      'vote_count': instance.vote_count,
      'video': instance.video,
      'vote_average': instance.vote_average,
      'revenue': instance.revenue,
      'production_companies': instance.production_companies,
    };
