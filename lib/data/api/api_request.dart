import 'package:dio/dio.dart';
import 'package:movie_app/data/models/detail_movie_object_res.dart';
import 'package:movie_app/data/models/movie_object_res.dart';
import 'package:movie_app/utils/constants.dart';

class ApiRequest {
  final Dio _dio = Dio();

  Future<List<MovieObjectRes>> getTopRatedMovie(int page) async {
    List<MovieObjectRes> response = [];
    final res =
        await _dio.get(Constants.url + Constants.discover, queryParameters: {
      'api_key': Constants.apiKey,
      'page': page,
      'sort_by': 'vote_average.desc',
      'vote_count.gte': '5000',
    });
    response = res.data['results']
        .map<MovieObjectRes>((e) => MovieObjectRes.fromJson(e))
        .toList();
    return response;
  }

  Future<List<MovieObjectRes>> searchMovieByName({required String name}) async {
    List<MovieObjectRes> response = [];
    final res =
        await _dio.get(Constants.url + Constants.search, queryParameters: {
      'api_key': Constants.apiKey,
      'query': name,
      'page': 1,
    });
    response = res.data['results'].map<MovieObjectRes>((e) {
      return MovieObjectRes.fromJson(e);
    }).toList();

    return response;
  }

  Future<DetailMovieObjectRes> findMovieById({required int movieId}) async {
    final res = await _dio
        .get(Constants.url + Constants.find + "/$movieId", queryParameters: {
      'api_key': Constants.apiKey,
    });
    DetailMovieObjectRes response = DetailMovieObjectRes.fromJson(res.data);

    return response;
  }
}
