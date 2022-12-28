import 'package:flutter/material.dart';
import 'package:jtconnect/config/color.dart';

class StyleConfig {
  static XLargStyle({bool bold = true}) {
    return TextStyle(fontSize: 35, fontWeight: bold ? FontWeight.w700 : null);
  }

  static customStyle(
      {bool success = false,
      bool bold = false,
      bool draw = false,
      double fontSize = 15,
      bool primary = false,
      FontWeight fontWeight = FontWeight.bold,
      bool light = false,
      bool accent = false,
      bool black = false,
      bool medium = false,
      bool xMedium = false,
      bool large = false,
      bool xLarge = false,
      bool xSmall = false,
      Color color = Colors.black}) {
    double switchSize() {
      if (medium) {
        return 18;
      } else if (xMedium) {
        return 20;
      } else if (xSmall) {
        return 8;
      } else if (large) {
        return 23.4;
      } else if (xLarge) {
        return 29.0;
      } else {
        return fontSize;
      }
    }

    return TextStyle(
        fontWeight: bold ? fontWeight : null,
        color: color,
        fontSize: switchSize());
  }
}
