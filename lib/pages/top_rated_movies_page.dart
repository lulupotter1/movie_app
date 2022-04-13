import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:movie_app/bloc/movie_bloc.dart';
import 'package:movie_app/data/models/movie_object_res.dart';
import 'package:movie_app/utils/theme_Text_styles.dart';
import 'package:movie_app/utils/theme_colors.dart';
import 'package:movie_app/widgets/custom_movie_container.dart';
import 'package:movie_app/widgets/default_body.dart';

class TopRatedMoviesPage extends StatefulWidget {
  const TopRatedMoviesPage({Key? key}) : super(key: key);

  @override
  State<TopRatedMoviesPage> createState() => _TopRatedMoviesPageState();
}

class _TopRatedMoviesPageState extends State<TopRatedMoviesPage> {
  final PagingController<int, MovieObjectRes> _pagingController =
      PagingController(firstPageKey: 0);
  int page = 1;

  @override
  void initState() {
    _pagingController.addPageRequestListener((pageKey) {
      try {
        if (pageKey == page) {
          page = page + 1;
          BlocProvider.of<MovieBloc>(context)
              .add(GetTopRatedMoviesEvent(page: page));
        }
      } catch (e) {
        _pagingController.error = e;
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultBody(
      backgroundColor: ThemeColors.primaryColor,
      bottomIndex: 0,
      title: 'Top movies',
      body: BlocBuilder<MovieBloc, MovieState>(
        builder: (context, state) {
          if (state is MovieLoading) {}
          if (state is MovieError) {
            return Center(
              child: Column(
                children: [
                  Text(
                    "Произошла ошибка по причине ${state.errorMessage}",
                    softWrap: true,
                    style: ThemeTextRegular.size14
                        .copyWith(color: ThemeColors.black),
                  ),
                  SizedBox(height: 20.h),
                  TextButton(
                    child: Text(
                      'Поробовать снова',
                      softWrap: true,
                      style: ThemeTextRegular.size14
                          .copyWith(color: ThemeColors.black),
                    ),
                    onPressed: () {
                      BlocProvider.of<MovieBloc>(context)
                          .add(GetTopRatedMoviesEvent(page: 1));
                    },
                  ),
                ],
              ),
            );
          }
          if (state is MovieLoaded) {
            _pagingController.appendPage(state.loadedResult, state.page);
          }
          return PagedListView<int, MovieObjectRes>.separated(
            pagingController: _pagingController,
            builderDelegate: PagedChildBuilderDelegate<MovieObjectRes>(
              itemBuilder: (context, item, index) {
                return CustomMovieContainer(
                  result: item,
                );
              },
            ),
            separatorBuilder: (BuildContext context, int index) => Divider(
              height: 16.h,
            ),
          );
        },
      ),
    );
  }
}
