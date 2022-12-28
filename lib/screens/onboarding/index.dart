import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:jtconnect/config/color.dart';
import 'package:jtconnect/config/navigation.dart';
import 'package:jtconnect/config/size.dart';
import 'package:jtconnect/config/style.dart';
import 'package:jtconnect/main.dart';
import 'package:jtconnect/screens/authentication/login.dart';
import 'package:jtconnect/widgets/button.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> with TickerProviderStateMixin {
  bool animateLines = false;
  bool animateText = false;
  bool animatedSmallText = false;
  bool animatedButton = false;

  @override
  void initState() {
    // load();
    startAnimation();
    super.initState();
  }

  // void load() {
  //   Timer(Duration(milliseconds: 10), () {
  //     setState(() {
  //       _isInitialValue = true;
  //     });
  //   });
  // }

  Future startAnimation() async {
    await Future.delayed(Duration(milliseconds: 500));
    setState(() => animateLines = true);
    await Future.delayed(Duration(milliseconds: 1000));
    setState(() => animateText = true);
    await Future.delayed(Duration(milliseconds: 500));
    setState(() => animatedSmallText = true);
    await Future.delayed(Duration(milliseconds: 1000));
    setState(() => animatedButton = true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConfig.onboardingColor,
      body: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            height: SizeConfig.getPercentageHeight(100),
          ),
          AnimatedPositioned(
            duration: Duration(seconds: 4),
            left: !animateLines
                ? -SizeConfig.getPercentageWidth(80)
                : -SizeConfig.getPercentageWidth(85),
            top: !animateLines
                ? SizeConfig.getPercentageWidth(3)
                : SizeConfig.getPercentageWidth(6),
            child: Container(
              width: SizeConfig.getPercentageHeight(59),
              height: SizeConfig.getPercentageHeight(59),
              decoration: BoxDecoration(
                  border: GradientBoxBorder(
                    gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomCenter,
                        colors: [
                          ColorConfig.primary,
                          Color(0xff6C7139).withOpacity(0.6)
                        ]),
                    width: 2,
                  ),
                  shape: BoxShape.circle),
            ),
          ),
          AnimatedPositioned(
            duration: Duration(seconds: 4),
            right: !animateLines
                ? SizeConfig.getPercentageWidth(14)
                : SizeConfig.getPercentageWidth(9),
            top: !animateLines
                ? -SizeConfig.getPercentageWidth(65)
                : -SizeConfig.getPercentageWidth(60),
            child: Container(
              width: SizeConfig.getPercentageHeight(59),
              height: SizeConfig.getPercentageHeight(59),
              decoration: BoxDecoration(
                  border: GradientBoxBorder(
                    gradient: LinearGradient(
                        begin: Alignment.centerRight,
                        end: Alignment.bottomCenter,
                        colors: [
                          ColorConfig.primary,
                          Color(0xff6C7139).withOpacity(0.6)
                        ]),
                    width: 2,
                  ),
                  shape: BoxShape.circle),
            ),
          ),
          AnimatedPositioned(
            duration: Duration(seconds: 4),
            left: !animateLines
                ? SizeConfig.getPercentageWidth(8)
                : SizeConfig.getPercentageWidth(11),
            top: !animateLines
                ? SizeConfig.getPercentageWidth(29.5)
                : SizeConfig.getPercentageWidth(34.5),
            child: Container(
              width: SizeConfig.getPercentageHeight(25),
              height: SizeConfig.getPercentageHeight(25),
              decoration: BoxDecoration(
                  border: GradientBoxBorder(
                    gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomCenter,
                        colors: [
                          ColorConfig.primary,
                          Color(0xff6C7139).withOpacity(0.6)
                        ]),
                    width: 2,
                  ),
                  shape: BoxShape.circle),
            ),
          ),

          // AnimatedContainer(
          //   duration: Duration(seconds: 1),
          //   width: _isInitialValue
          //       ? SizeConfig.getPercentageWidth(100)
          //       : SizeConfig.getPercentageWidth(80),
          //   child: Image(
          //       opacity: AnimationController(vsync: this, value: 0.5),
          //       image: AssetImage(AssetConfig.getFromIcons("Mask group.png"))),
          // ),
          AnimatedPositioned(
            duration: Duration(seconds: 2),
            bottom: animateText
                ? SizeConfig.getPercentageHeight(32)
                : SizeConfig.getPercentageHeight(28),
            left: 0,
            right: 0,
            child: AnimatedOpacity(
              duration: Duration(seconds: 1),
              opacity: animateText ? 1 : 0,
              child: Center(
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                      text: "Ensure Flexibility \n with ",
                      style: StyleConfig.XLargStyle(),
                      children: [
                        TextSpan(
                            text: "JT",
                            style: TextStyle(color: ColorConfig.primary)),
                        TextSpan(
                          text: "-",
                        ),
                        TextSpan(
                            text: "Connect",
                            style: TextStyle(color: ColorConfig.primary))
                      ]),
                ),
              ),
            ),
          ),
          AnimatedPositioned(
            duration: Duration(seconds: 2),
            bottom: animatedSmallText
                ? SizeConfig.getPercentageHeight(23)
                : SizeConfig.getPercentageHeight(19),
            left: 0,
            right: 0,
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.getPercentageWidth(20),
                  vertical: SizeConfig.getPercentageHeight(2.5)),
              child: AnimatedDefaultTextStyle(
                curve: Curves.easeIn,
                duration: Duration(milliseconds: 500),
                style: animatedSmallText
                    ? TextStyle(height: 1.5, color: ColorConfig.B60)
                    : TextStyle(height: 3.5, color: ColorConfig.B60),
                child: AnimatedOpacity(
                  duration: Duration(seconds: 2),
                  opacity: animateText ? 1 : 0,
                  child: Text(
                    "Manage your utility maintenance charges smoothly",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: ColorConfig.B100),
                  ),
                ),
              ),
            ),
          ),
          AnimatedPositioned(
            duration: Duration(seconds: 1),
            bottom: animatedButton
                ? SizeConfig.getPercentageHeight(12)
                : SizeConfig.getPercentageHeight(6),
            left: 0,
            right: 0,
            child: Column(
              children: [
                AnimatedOpacity(
                  duration: Duration(seconds: 1),
                  opacity: animatedButton ? 1 : 0,
                  child: CustomButton(
                    title: "Get Started",
                    xMargin: SizeConfig.getPercentageWidth(3),
                    topMargin: SizeConfig.getPercentageHeight(1),
                    action: () {
                      setState(() {
                        NavConfig.pushReplace(
                            context,

                            //AuthenticationScreen()

                            CloudClinic());
                      });
                    },
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
