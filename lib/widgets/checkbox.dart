import 'package:flutter/material.dart';
import 'package:jtconnect/config/color.dart';
import 'package:jtconnect/config/size.dart';

class CustomCheckbox extends StatelessWidget {
  final Function()? action;
  const CustomCheckbox(
      {Key? key, required this.keepmesigning, required this.action, this.size})
      : super(key: key);

  final bool keepmesigning;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: action,
      child: Container(
        width: SizeConfig.getPercentageWidth(size ?? 5),
        height: SizeConfig.getPercentageWidth(size ?? 5),
        margin: EdgeInsets.only(right: SizeConfig.getPercentageWidth(2)),
        decoration: BoxDecoration(
            border:
                Border.all(width: keepmesigning ? 0 : 1, color: Colors.grey),
            borderRadius: BorderRadius.circular(5),
            color: keepmesigning ? ColorConfig.primary : Colors.white),
        child: Icon(
          Icons.check,
          size: size != null ? (size!.toDouble() * 3.7) : 18,
          color: Colors.white,
        ),
      ),
    );
  }
}
