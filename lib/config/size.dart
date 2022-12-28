import 'package:flutter/material.dart';

class SizeConfig {
  static late MediaQueryData _mediaQueryData;
  static late double screenHeight;
  static late double screenWidth;
  static late double shortSide;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenHeight = _mediaQueryData.size.height;
    screenWidth = _mediaQueryData.size.width;
    shortSide = _mediaQueryData.size.shortestSide;
  }

  static double getPercentageHeight(double percentage) {
    return SizeConfig.screenHeight * percentage * 0.01;
  }

  static double getPercentageWidth(double percentage) {
    return SizeConfig.screenWidth * percentage * 0.01;
  }

  static double getShortestSide(double percentage) {
    return SizeConfig.shortSide * percentage * 0.01;
  }
}
