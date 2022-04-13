import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:movie_app/bloc/movie_bloc.dart';
import 'package:movie_app/data/models/detail_movie_object_res.dart';
import 'package:movie_app/utils/constants.dart';
import 'package:movie_app/utils/theme_Text_styles.dart';
import 'package:movie_app/utils/theme_colors.dart';
import 'package:movie_app/widgets/custom_movie_container.dart';
import 'package:movie_app/widgets/custom_stars.dart';
import 'package:movie_app/widgets/default_body.dart';

class DetailMoviePage extends StatelessWidget {
  const DetailMoviePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieBloc, MovieState>(
      builder: (context, state) {
        if (state is DetailMovieLoaded) {
          return DefaultBody(
            backgroundColor: ThemeColors.primaryColor,
            showBottom: false,
            showLeading: true,
            title: state.loadedResult.original_title,
            body: Column(
              children: [
                if (state.loadedResult.backdrop_path != null)
                  SizedBox(
                      height: 200.h,
                      width: double.infinity,
                      child: Image.network(Constants.imageUrl +
                          state.loadedResult.backdrop_path!)),
                SizedBox(
                  height: 20.h,
                ),
                MovieShortInformation(
                  loadedResult: state.loadedResult,
                ),
                SizedBox(
                  height: 20.h,
                ),
                Column(
                  children: [
                    _customRow('Release Date', state.loadedResult.release_date),
                    _customRow(
                        'Language', state.loadedResult.original_language),
                    _customRow('Budget', state.loadedResult.budget.toString()),
                    _customRow(
                        'Revenue', state.loadedResult.revenue.toString()),
                    _customRow('Production Company',
                        _getCompanies(state.loadedResult)),
                  ],
                ),
              ],
            ),
          );
        }
        if (state is MovieError) {
          return Center(
            child: Text(
              "Произошла ошибка по причине ${state.errorMessage}",
              softWrap: true,
              style: ThemeTextRegular.size14.copyWith(color: ThemeColors.black),
            ),
          );
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }

  String _getCompanies(DetailMovieObjectRes loadedResult) {
    String text = loadedResult.production_companies
        .map((e) => e.name)
        .toList()
        .join(', ');
    return text;
  }

  Widget _customRow(String leftText, String rightText) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Text(
              leftText,
              textAlign: TextAlign.right,
              softWrap: true,
              style: ThemeTextRegular.size15,
            ),
          ),
          SizedBox(
            width: 8.w,
          ),
          Expanded(
            flex: 2,
            child: Text(
              rightText,
              softWrap: true,
              style: ThemeTextRegular.size14
                  .copyWith(color: ThemeColors.grayColor),
            ),
          ),
        ],
      );
}

class MovieShortInformation extends StatelessWidget {
  DetailMovieObjectRes loadedResult;
  MovieShortInformation({Key? key, required this.loadedResult})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 120.h,
            width: 70.w,
            decoration: BoxDecoration(
              image: loadedResult.poster_path != null
                  ? DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                          Constants.imageUrl + loadedResult.poster_path!))
                  : null,
              color: ThemeColors.tertiaryColor,
              borderRadius: BorderRadius.all(
                Radius.circular(4.r),
              ),
            ),
          ),
          SizedBox(
            width: 10.w,
          ),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  loadedResult.original_title,
                  softWrap: true,
                  style: ThemeTextRegular.size18,
                ),
                SizedBox(
                  height: 8.h,
                ),
                SingleChildScrollView(
                  child: Row(
                    children: [
                      for (int i = 0; i < loadedResult.genres.length; i++)
                        Padding(
                          padding: EdgeInsets.only(right: 8.w),
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 8.w, vertical: 8.h),
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: ThemeColors.grayColor)),
                            child: Text(
                              loadedResult.genres[i]['name'],
                              softWrap: true,
                              style: ThemeTextRegular.size14,
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  children: [
                    CustomStars(
                      starsCount: loadedResult.vote_average / 2,
                    ),
                    SizedBox(
                      width: 8.w,
                    ),
                    Text(
                      "(${loadedResult.vote_count})",
                      style: ThemeTextRegular.size14
                          .copyWith(color: ThemeColors.tertiaryColor),
                    ),
                  ],
                ),
                SizedBox(
                  height: 8.h,
                ),
                Text(
                  loadedResult.overview,
                  softWrap: true,
                  style: ThemeTextRegular.size14
                      .copyWith(color: ThemeColors.grayColor),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
