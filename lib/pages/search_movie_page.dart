import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:movie_app/bloc/movie_bloc.dart';
import 'package:movie_app/data/models/movie_object_res.dart';
import 'package:movie_app/utils/theme_Text_styles.dart';
import 'package:movie_app/utils/theme_colors.dart';
import 'package:movie_app/widgets/custom_movie_container.dart';
import 'package:movie_app/widgets/default_body.dart';

class SearchMoviePage extends StatefulWidget {
  SearchMoviePage({Key? key}) : super(key: key);

  @override
  State<SearchMoviePage> createState() => _SearchMoviePageState();
}

class _SearchMoviePageState extends State<SearchMoviePage> {
  late TextEditingController controller;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    controller = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<MovieObjectRes> loadedResult = [];
    return BlocConsumer<MovieBloc, MovieState>(
      listener: (context, state) {
        if (state is NavigateToNextScreen) {
          Navigator.pushNamed(context, state.appRoutes);
        }
      },
      builder: (context, state) {
        return DefaultBody(
          backgroundColor: ThemeColors.primaryColor,
          controller: controller,
          bottomIndex: 1,
          showLeading: false,
          title: '',
          body: BlocBuilder<MovieBloc, MovieState>(
            builder: (context, state) {
              if (state is MovieLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is MovieError) {
                return Center(
                  child: Text(
                    "Произошла ошибка по причине ${state.errorMessage}",
                    softWrap: true,
                    style: ThemeTextRegular.size14,
                  ),
                );
              }
              if (state is MovieLoaded) {
                loadedResult = state.loadedResult;
              }
              if (loadedResult.isEmpty) {
                return const Center(
                  child: Text(
                    "Нету совпадении",
                    softWrap: true,
                    style: ThemeTextRegular.size14,
                  ),
                );
              }
              return ListView.separated(
                itemCount: loadedResult.length,
                itemBuilder: (context, index) => CustomMovieContainer(
                  result: loadedResult[index],
                ),
                separatorBuilder: (BuildContext context, int index) => Divider(
                  height: 16.h,
                ),
              );
            },
          ),
        );
      },
    );
  }
}
