part of 'movie_bloc.dart';

@immutable
abstract class MovieState {}

class MovieInitial extends MovieState {}

class MovieLoaded extends MovieState {
  int page;
  List<MovieObjectRes> loadedResult;
  MovieLoaded({
    required this.loadedResult,
    required this.page,
  });
}

class NavigateToNextScreen extends MovieState {
  String appRoutes;
  NavigateToNextScreen({required this.appRoutes});
}

class DetailMovieLoaded extends MovieState {
  DetailMovieObjectRes loadedResult;
  DetailMovieLoaded({
    required this.loadedResult,
  });
}

class MovieLoading extends MovieState {}

class MovieError extends MovieState {
  String errorMessage;
  MovieError({
    required this.errorMessage,
  });
}
