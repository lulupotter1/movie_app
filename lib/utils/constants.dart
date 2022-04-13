import 'package:flutter/material.dart';
import 'package:movie_app/pages/detail_movie_page.dart';
import 'package:movie_app/pages/search_movie_page.dart';
import 'package:movie_app/pages/splash_screen.dart';
import 'package:movie_app/pages/top_rated_movies_page.dart';

class Constants {
  static const url = 'https://api.themoviedb.org/3';
  static const discover = '/discover/movie';
  static const search = '/search/movie';
  static const find = '/movie';
  static const apiKey = '34096ec2fc8867f746a784ebcfa5ed6e';
  static const title = 'Movie App';
  static const imageUrl = 'https://image.tmdb.org/t/p/w500';

  static const Map<int, String> genreS = {
    28: "Action",
    12: "Adventure",
    16: "Animation",
    35: "Comedy",
    80: "Crime",
    99: "Documentary",
    18: "Drama",
    10751: "Family",
    14: "Fantasy",
    36: "History",
    27: "Horror",
    10402: "Music",
    9648: "Mystery",
    10749: "Romance",
    878: "Science Fiction ",
    10770: "TV Movie ",
    53: "Thriller",
    10752: "War",
    37: "Western",
  };
}

class AppRoutes {
  static const routeToTopRatedMoviesPage = '/TopRatedMoviesPage';
  static const routeToDetailMoviePage = '/DetailMoviePage';
  static const routeToSearchMoviePage = '/SearchMoviePage';
  static const routeToSplashScreen = '/SplashScreen';

  static Map<String, WidgetBuilder> getRoutes() {
    Map<String, WidgetBuilder> base = {
      AppRoutes.routeToSplashScreen: (BuildContext _) => SplashScreen(),
      AppRoutes.routeToTopRatedMoviesPage: (BuildContext _) =>
          TopRatedMoviesPage(),
      AppRoutes.routeToDetailMoviePage: (BuildContext _) => DetailMoviePage(),
      AppRoutes.routeToSearchMoviePage: (BuildContext _) => SearchMoviePage(),
    };
    return base;
  }
}
