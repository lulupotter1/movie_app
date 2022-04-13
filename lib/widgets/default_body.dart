import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_app/bloc/movie_bloc.dart';
import 'package:movie_app/utils/constants.dart';
import 'package:movie_app/utils/theme_colors.dart';
import 'package:movie_app/utils/theme_text_styles.dart';

class DefaultBody extends StatelessWidget {
  TextEditingController? controller;
  int? bottomIndex;
  Widget body;
  String title;
  bool showLeading;
  bool showBottom;
  Color? backgroundColor;
  DefaultBody({
    Key? key,
    this.bottomIndex,
    required this.body,
    required this.title,
    this.showLeading = false,
    this.showBottom = true,
    this.backgroundColor,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Timer? timer;

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        automaticallyImplyLeading: showLeading,
        backgroundColor: ThemeColors.primaryColor,
        titleTextStyle: ThemeTextRegular.size14,
        title: controller != null
            ? Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5)),
                child: Center(
                  child: TextField(
                    decoration: InputDecoration(
                        hintText: 'Search',
                        hintStyle: ThemeTextRegular.size14
                            .copyWith(color: ThemeColors.grayColor),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 8.w, vertical: 4.h)),
                    style: ThemeTextRegular.size18
                        .copyWith(color: ThemeColors.primaryColor),
                    controller: controller,
                    onChanged: (value) {
                      if (controller!.text.isNotEmpty) {
                        timer = Timer(const Duration(seconds: 2), () {
                          if (controller!.text.isNotEmpty) {
                            BlocProvider.of<MovieBloc>(context)
                                .add(SearchMoviesEvent(name: controller!.text));
                          }
                        });
                      }
                    },
                  ),
                ),
              )
            : Text(
                title,
                style: ThemeTextRegular.size15,
              ),
      ),
      body: body,
      bottomNavigationBar: showBottom && bottomIndex != null
          ? BottomNavigationBar(
              currentIndex: bottomIndex!,
              backgroundColor: ThemeColors.primaryColor,
              type: BottomNavigationBarType.fixed,
              items: const [
                BottomNavigationBarItem(
                  label: 'Movies',
                  icon: const Icon(
                    Icons.movie_creation_outlined,
                  ),
                ),
                BottomNavigationBarItem(
                  label: 'Search',
                  icon: const Icon(Icons.search_outlined),
                ),
              ],
              onTap: (index) {
                if (index == 0 && bottomIndex != index) {
                  BlocProvider.of<MovieBloc>(context).add(
                      GetTopRatedMoviesEvent(
                          page: 1,
                          appRoutes: AppRoutes.routeToTopRatedMoviesPage));
                } else if (index == 1 && bottomIndex != index) {
                  Navigator.pushNamed(
                      context, AppRoutes.routeToSearchMoviePage);
                }
              },
            )
          : null,
    );
  }
}
