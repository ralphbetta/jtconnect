import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:jtconnect/config/color.dart';
import 'package:jtconnect/config/size.dart';
import 'package:provider/provider.dart';

class SocialButton extends StatefulWidget {
  final bool isFacebook;
  const SocialButton({
    Key? key,
    required this.isFacebook,
  }) : super(key: key);

  @override
  State<SocialButton> createState() => _SocialButtonState();
}

class _SocialButtonState extends State<SocialButton> {
  bool isSingingIn = false;

  void startSpinner({bool status = true}) {
    print("setting state");
    setState(() {
      isSingingIn = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () async {},
        child: Container(
          padding: EdgeInsets.symmetric(
            vertical: SizeConfig.getPercentageWidth(4.8),
            horizontal: SizeConfig.getPercentageWidth(3),
          ),
          decoration: BoxDecoration(
              color: widget.isFacebook
                  ? const Color(0xff3B5998)
                  : Colors.transparent,
              border: Border.all(
                width: 1,
                color: widget.isFacebook ? const Color(0xff3B5998) : Colors.red,
              ),
              borderRadius: BorderRadius.circular(
                SizeConfig.getPercentageWidth(3),
              )),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              !isSingingIn
                  ? Image(
                      image: widget.isFacebook
                          ? const AssetImage("assets/icons/search.png")
                          : const AssetImage("assets/icons/search.png"),
                      width: widget.isFacebook
                          ? SizeConfig.getPercentageWidth(2)
                          : SizeConfig.getPercentageWidth(4),
                    )
                  : SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        valueColor:
                            AlwaysStoppedAnimation<Color>(ColorConfig.primary),
                      ),
                    ),
              SizedBox(
                width: SizeConfig.getPercentageWidth(3),
              ),
              Text(
                widget.isFacebook ? "Facebook" : "Google",
                style: TextStyle(
                    color: widget.isFacebook ? Colors.white : Colors.black87,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      ),
    );
  }
}
