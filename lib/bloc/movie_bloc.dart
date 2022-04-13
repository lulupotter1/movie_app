import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movie_app/data/api/api_request.dart';
import 'package:movie_app/data/models/detail_movie_object_res.dart';
import 'package:movie_app/data/models/movie_object_res.dart';

part 'movie_event.dart';
part 'movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  MovieBloc() : super(MovieInitial());

  @override
  Stream<MovieState> mapEventToState(MovieEvent event) async* {
    if (event is GetTopRatedMoviesEvent) {
      if (event.appRoutes != null) {
        yield NavigateToNextScreen(appRoutes: event.appRoutes!);
      }

      yield MovieLoading();

      try {
        var result = await ApiRequest().getTopRatedMovie(event.page);
        yield MovieLoaded(loadedResult: result, page: event.page);
      } catch (e) {
        yield MovieError(errorMessage: e.toString());
      }
    }
    if (event is SearchMoviesEvent) {
      yield MovieLoading();

      try {
        var result = await ApiRequest().searchMovieByName(name: event.name);
        yield MovieLoaded(loadedResult: result, page: 1);
      } catch (e) {
        yield MovieError(errorMessage: e.toString());
      }
    }
    if (event is FindMoviesEvent) {
      yield MovieLoading();
      try {
        DetailMovieObjectRes result =
            await ApiRequest().findMovieById(movieId: event.movieId);
        yield DetailMovieLoaded(loadedResult: result);
      } catch (e) {
        yield MovieError(errorMessage: e.toString());
      }
    }
  }
}
