part of 'movie_bloc.dart';

@immutable
abstract class MovieEvent {}

class GetTopRatedMoviesEvent extends MovieEvent {
  int page;
  String? appRoutes;
  GetTopRatedMoviesEvent({
    required this.page,
    this.appRoutes,
  });
}

class SearchMoviesEvent extends MovieEvent {
  String name;
  SearchMoviesEvent({
    required this.name,
  });
}

class FindMoviesEvent extends MovieEvent {
  int movieId;
  FindMoviesEvent({
    required this.movieId,
  });
}
