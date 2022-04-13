import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:movie_app/bloc/movie_bloc.dart';
import 'package:movie_app/data/models/movie_object_res.dart';
import 'package:movie_app/utils/constants.dart';
import 'package:movie_app/utils/theme_Text_styles.dart';
import 'package:movie_app/utils/theme_colors.dart';
import 'package:movie_app/widgets/custom_stars.dart';

class CustomMovieContainer extends StatelessWidget {
  MovieObjectRes result;
  CustomMovieContainer({
    Key? key,
    required this.result,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        BlocProvider.of<MovieBloc>(context)
            .add(FindMoviesEvent(movieId: result.id));

        Navigator.pushNamed(context, AppRoutes.routeToDetailMoviePage);
      },
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
            child: Container(
              height: 80.h,
              width: 50.w,
              decoration: BoxDecoration(
                image: result.poster_path != null
                    ? DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                            Constants.imageUrl + result.poster_path!))
                    : null,
                color: ThemeColors.tertiaryColor,
                borderRadius: BorderRadius.all(
                  Radius.circular(4.r),
                ),
              ),
            ),
          ),
          SizedBox(
            width: 10.w,
          ),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      result.original_title,
                      softWrap: true,
                      style: ThemeTextRegular.size14,
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Text(
                      _getGenreString(),
                      softWrap: true,
                      style: ThemeTextRegular.size14
                          .copyWith(color: ThemeColors.grayColor),
                    ),
                  ],
                ),
                SizedBox(
                  height: 8.h,
                ),
                Row(
                  children: [
                    CustomStars(
                      starsCount: result.vote_average / 2,
                    ),
                    SizedBox(
                      width: 8.w,
                    ),
                    Text(
                      "(${result.vote_count})",
                      style: ThemeTextRegular.size14
                          .copyWith(color: ThemeColors.tertiaryColor),
                    ),
                  ],
                )
              ],
            ),
          ),
          Icon(
            Icons.keyboard_arrow_right,
            color: ThemeColors.white,
            size: 32.h,
          )
        ],
      ),
    );
  }

  _getGenreString() {
    List list = [];
    list = result.genre_ids.map((e) => Constants.genreS[e]!).toList();
    return list.isNotEmpty ? list.join(", ") : 'No genre';
  }
}
