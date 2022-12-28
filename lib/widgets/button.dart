import 'package:flutter/material.dart';
import 'package:jtconnect/config/color.dart';
import 'package:jtconnect/config/size.dart';
import 'package:jtconnect/config/style.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {Key? key,
      required this.title,
      this.btnSize = 19,
      this.xMargin = 0,
      this.topMargin = 0,
      this.bottomMargin = 0,
      this.action,
      this.primary = true})
      : super(key: key);

  final String title;
  final double xMargin;
  final double topMargin;
  final double bottomMargin;
  final bool primary;
  final double btnSize;
  final Function()? action;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: action,
      child: Container(
        margin: EdgeInsets.only(
            left: SizeConfig.getPercentageWidth(xMargin),
            right: SizeConfig.getPercentageWidth(xMargin),
            top: SizeConfig.getPercentageWidth(topMargin),
            bottom: SizeConfig.getPercentageWidth(bottomMargin)),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: primary
                    ? [
                        ColorConfig.primary,
                        Color(0xFF6C7139),
                      ]
                    : [Colors.black])),
        padding: EdgeInsets.symmetric(
          vertical: SizeConfig.getPercentageWidth(4.5),
        ),
        width: SizeConfig.getPercentageWidth(100),
        child: Center(
            child: Text(
          title,
          style: StyleConfig.customStyle(
              light: true, medium: true, color: Colors.white),
        )),
      ),
    );
  }
}
