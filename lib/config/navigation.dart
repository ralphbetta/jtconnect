import 'package:flutter/material.dart';

class NavConfig {
  static Future<dynamic> pushRemove(BuildContext context, screen) {
    return Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => screen),
        (Route<dynamic> route) => false);
  }

  static Future<dynamic> push(BuildContext context, screen) {
    return Navigator.push(context, MaterialPageRoute(builder: (context) {
      return screen;
    }));
  }

  static Future<dynamic> pushReplace(BuildContext context, screen) {
    return Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => screen,
      ),
    );
  }
}
