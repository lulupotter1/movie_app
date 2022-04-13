import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:movie_app/utils/theme_colors.dart';

class CustomStars extends StatelessWidget {
  double starsCount;
  CustomStars({
    Key? key,
    required this.starsCount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String starsCountStr = starsCount.toString();
    var listOfChar = starsCountStr.split('.');
    if (listOfChar.length > 1) {
      return _customRowOfStar(starsCount.floor(), false);
    } else {
      return _customRowOfStar(starsCount.floor(), true);
    }
  }

  Widget _customRowOfStar(int index, bool half) {
    return Row(children: [
      for (int i = 0; i < 5; i++)
        Row(children: [
          Padding(
            padding: EdgeInsets.only(right: 5.w),
            child: CustomStar(
              coloredType: _getStarType(index, i, half),
            ),
          ),
        ])
    ]);
  }

  ColoredType _getStarType(int index, int i, bool half) {
    if (index - 1 >= i) {
      return ColoredType.fullColor;
    } else if (index - 1 < i) {
      if (half) {
        return ColoredType.halfColor;
      } else {
        return ColoredType.noColor;
      }
    }
    return ColoredType.noColor;
  }
}

class CustomStar extends StatelessWidget {
  ColoredType coloredType;
  CustomStar({
    Key? key,
    this.coloredType = ColoredType.noColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (coloredType) {
      case ColoredType.fullColor:
        return Icon(Icons.star, color: ThemeColors.tertiaryColor, size: 16.h);
      case ColoredType.halfColor:
        return Icon(Icons.star_half,
            color: ThemeColors.tertiaryColor, size: 16.h);
      case ColoredType.noColor:
        return Icon(Icons.star_border,
            color: ThemeColors.tertiaryColor, size: 16.h);
    }
  }
}

enum ColoredType { fullColor, halfColor, noColor }
