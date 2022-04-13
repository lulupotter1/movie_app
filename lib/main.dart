import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/bloc/movie_bloc.dart';
import 'package:movie_app/utils/constants.dart';
import 'package:movie_app/utils/theme_colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MovieBloc(),
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (_) => MaterialApp(
          debugShowCheckedModeBanner: false,
          title: Constants.title,
          initialRoute: AppRoutes.routeToSplashScreen,
          routes: AppRoutes.getRoutes(),
        ),
      ),
    );
  }
}
