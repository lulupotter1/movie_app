import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie_app/bloc/movie_bloc.dart';
import 'package:movie_app/utils/constants.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _getDataAndNavigate();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<MovieBloc, MovieState>(
      listener: (context, state) async {
        if (state is NavigateToNextScreen) {
          await Future.delayed(const Duration(seconds: 2));
          Navigator.pushNamed(context, state.appRoutes);
        }
      },
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  _getDataAndNavigate() async {
    BlocProvider.of<MovieBloc>(context).add(GetTopRatedMoviesEvent(
        page: 1, appRoutes: AppRoutes.routeToTopRatedMoviesPage));
  }
}
