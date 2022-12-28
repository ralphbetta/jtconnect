import 'package:flutter/material.dart';
import 'package:jtconnect/config/assets.dart';
import 'package:jtconnect/config/color.dart';
import 'package:jtconnect/config/navigation.dart';
import 'package:jtconnect/config/size.dart';
import 'package:jtconnect/config/style.dart';
import 'package:jtconnect/constants/controllers.dart';
import 'package:jtconnect/constants/country.dart';
import 'package:jtconnect/screens/tab/main.dart';
import 'package:jtconnect/widgets/checkbox.dart';
import 'package:jtconnect/widgets/social.dart';
import 'package:jtconnect/widgets/textField.dart';

class AuthenticationScreen extends StatefulWidget {
  const AuthenticationScreen({super.key});

  @override
  State<AuthenticationScreen> createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen> {
  bool _isLoaded = false;
  bool _login = true;
  int activeIndex = 0;
  bool keepMeLogged = false;
  bool showCountry = false;

  List authData = ["Login", "Register"];

  @override
  void initState() {
    phoneController.text = "+234";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          /*------------------------------
          Logo Section
          -------------------------------*/
          Container(
            width: SizeConfig.getPercentageWidth(100),
            height: SizeConfig.getPercentageHeight(100),
            child: Column(
              children: [
                Padding(
                  padding:
                      EdgeInsets.only(top: SizeConfig.getPercentageHeight(17)),
                  child: Image(
                      width: SizeConfig.getPercentageWidth(40),
                      image: AssetImage(
                          AssetConfig.getFromIcon("icon-trans.png"))),
                )
              ],
            ),
          ),
          AnimatedPositioned(
              top: _isLoaded
                  ? -SizeConfig.getPercentageHeight(5)
                  : -SizeConfig.getPercentageHeight(6),
              left: _isLoaded
                  ? -SizeConfig.getPercentageHeight(2)
                  : -SizeConfig.getPercentageHeight(7),
              child: CircleAvatar(
                  radius: 100, backgroundColor: ColorConfig.primary),
              duration: Duration(seconds: 1)),
          AnimatedPositioned(
            duration: Duration(seconds: 1),
            top: _isLoaded
                ? SizeConfig.getPercentageHeight(18)
                : SizeConfig.getPercentageHeight(10),
            right: _isLoaded
                ? -SizeConfig.getPercentageHeight(5)
                : -SizeConfig.getPercentageHeight(5),
            child: CircleAvatar(radius: 40, backgroundColor: ColorConfig.B50),
          ),

          /*------------------------------
          Bottom Section
          -------------------------------*/
          AnimatedPositioned(
            duration: Duration(seconds: 1),
            bottom: _isLoaded
                ? -SizeConfig.getPercentageHeight(2)
                : -SizeConfig.getPercentageHeight(2),
            right: 0,
            left: 0,
            child: Container(
              width: SizeConfig.getPercentageWidth(100),
              height: SizeConfig.getPercentageHeight(10),
              decoration: BoxDecoration(
                  color: ColorConfig.B30,
                  borderRadius: BorderRadius.circular(50)),
              child: Column(
                children: [
                  Padding(
                    padding:
                        EdgeInsets.only(top: SizeConfig.getPercentageHeight(2)),
                    child: RichText(
                      text: TextSpan(
                          text: "Powered by ",
                          style: StyleConfig.customStyle(),
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
                  )
                ],
              ),
            ),
          ),

          /*------------------------------
         Google SignIn
          -------------------------------*/
          AnimatedPositioned(
              duration: Duration(milliseconds: 100),
              left: _login ? 0 : -SizeConfig.getPercentageWidth(180),
              right: _login ? 0 : SizeConfig.getPercentageWidth(180),
              bottom: SizeConfig.getPercentageHeight(17),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: ColorConfig.B50)),
                padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.getPercentageWidth(5),
                  vertical: SizeConfig.getPercentageWidth(5),
                ),
                margin: EdgeInsets.symmetric(
                  horizontal: SizeConfig.getPercentageWidth(5),
                ),
                width: SizeConfig.getPercentageWidth(100),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image(
                        width: SizeConfig.getPercentageWidth(4),
                        image:
                            AssetImage(AssetConfig.getFromIcons("search.png"))),
                    SizedBox(
                      width: SizeConfig.getPercentageWidth(2),
                    ),
                    Text("SIGN IN WITH GOOGLE")
                  ],
                ),
              )),

          /*------------------------------
          Form Section
          -------------------------------*/
          Positioned(
            top: SizeConfig.getPercentageHeight(33),
            right: 0,
            left: 0,
            child: AnimatedContainer(
                curve: Curves.fastOutSlowIn,
                duration: Duration(seconds: 1),
                width: SizeConfig.getPercentageWidth(100),
                height: _login
                    ? SizeConfig.getPercentageHeight(32)
                    : SizeConfig.getPercentageHeight(51.5),
                margin: EdgeInsets.symmetric(
                    horizontal: SizeConfig.getPercentageWidth(5)),
                padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.getPercentageWidth(5)),
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: ColorConfig.B30,
                          blurRadius: 15,
                          offset: Offset(1, 2))
                    ],
                    borderRadius: BorderRadius.circular(20)),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      /*---------------------------------
                      Username - Section
                      ---------------------------------*/
                      AnimatedContainer(
                        height: _login
                            ? SizeConfig.getPercentageWidth(0)
                            : SizeConfig.getPercentageWidth(30),
                        duration: Duration(milliseconds: 500),
                        child: SingleChildScrollView(
                          child: AnimatedOpacity(
                            opacity: _login ? 1 : 1,
                            duration: Duration(milliseconds: 500),
                            child: InputField(
                              title: "Enter Username",
                              label: "Username",
                              errorMessage: phoneMessage,
                              borderColor: formStateColor(phoneIndicator),
                              marginTop: SizeConfig.getPercentageWidth(1),
                              controller: emailController,
                              onChange: (String? value) {
                                setState(() {
                                  phoneIndicator = formErrorState.none;
                                  phoneMessage = "";
                                });
                              },
                              onSelect: (String? value) {
                                phoneController.text = supportedCountries
                                    .where(
                                        (element) => element['name'] == value)
                                    .first['dialCode']
                                    .toString();
                              },
                            ),
                          ),
                        ),
                      ),

                      /*---------------------------------
                      Country - Phone Field
                      ---------------------------------*/
                      AnimatedContainer(
                        height: _login
                            ? SizeConfig.getPercentageWidth(0)
                            : showCountry
                                ? SizeConfig.getPercentageWidth(73)
                                : SizeConfig.getPercentageWidth(25),
                        duration: Duration(milliseconds: 1000),
                        child: SingleChildScrollView(
                          child: AnimatedOpacity(
                            opacity: _login ? 1 : 1,
                            duration: Duration(milliseconds: 1000),
                            child: InputField(
                              title: "Enter Phone",
                              label: "Phone Number",
                              isPhone: true,
                              errorMessage: phoneMessage,
                              borderColor: formStateColor(phoneIndicator),
                              marginTop: SizeConfig.getPercentageWidth(0.4),
                              controller: phoneController,
                              onChange: (value) {
                                setState(() {
                                  showCountry = value;
                                });
                              },
                              onSelect: (String? value) {
                                phoneController.text = supportedCountries
                                    .where(
                                        (element) => element['name'] == value)
                                    .first['dialCode']
                                    .toString();
                              },
                            ),
                          ),
                        ),
                      ),
                      /*---------------------------------
                        Email - Section
                        ---------------------------------*/
                      InputField(
                        title: "Enter Email *",
                        label: "Email Address",
                        errorMessage: phoneMessage,
                        borderColor: formStateColor(phoneIndicator),
                        marginTop: SizeConfig.getPercentageWidth(0.4),
                        controller: emailController,
                        onChange: (String? value) {
                          setState(() {
                            phoneIndicator = formErrorState.none;
                            phoneMessage = "";
                          });
                        },
                        onSelect: (String? value) {
                          phoneController.text = supportedCountries
                              .where((element) => element['name'] == value)
                              .first['dialCode']
                              .toString();
                        },
                      ),
                      /*---------------------------------
                      Password - Section
                      ---------------------------------*/
                      InputField(
                        title: "Enter Password",
                        label: "Secured Password",
                        secured: true,
                        errorMessage: phoneMessage,
                        borderColor: formStateColor(phoneIndicator),
                        marginTop: SizeConfig.getPercentageWidth(0.4),
                        controller: passwordController,
                        onChange: (String? value) {
                          setState(() {
                            phoneIndicator = formErrorState.none;
                            phoneMessage = "";
                          });
                        },
                        onSelect: (String? value) {
                          phoneController.text = supportedCountries
                              .where((element) => element['name'] == value)
                              .first['dialCode']
                              .toString();
                        },
                      ),

                      /*---------------------------------
                 Checkbox section
                ---------------------------------*/
                      AnimatedContainer(
                        height: !_login
                            ? SizeConfig.getPercentageWidth(0)
                            : SizeConfig.getPercentageWidth(30),
                        duration: Duration(milliseconds: 500),
                        child: SingleChildScrollView(
                          child: AnimatedOpacity(
                            opacity: !_login ? 1 : 1,
                            duration: Duration(milliseconds: 500),
                            child: Padding(
                              padding: EdgeInsets.only(
                                top: SizeConfig.getPercentageHeight(2),
                                bottom: SizeConfig.getPercentageHeight(2),
                              ),
                              child: Row(
                                children: [
                                  CustomCheckbox(
                                      action: () {
                                        setState(() {
                                          keepMeLogged = !keepMeLogged;
                                        });
                                      },
                                      keepmesigning: keepMeLogged),
                                  Text(
                                    "Remember Me",
                                    style: TextStyle(
                                        color: ColorConfig.primary,
                                        fontSize: 17),
                                  ),
                                  const Expanded(child: SizedBox()),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
          ),

          /*------------------------------
          Proceed Button
          -------------------------------*/
          AnimatedPositioned(
            curve: Curves.fastOutSlowIn,
            duration: Duration(seconds: 1),
            top: _login
                ? SizeConfig.getPercentageHeight(61.5)
                : SizeConfig.getPercentageHeight(81),
            right: 0,
            left: 0,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  NavConfig.pushRemove(context, TabScreen());
                });
              },
              child: CircleAvatar(
                backgroundColor: ColorConfig.primary,
                radius: 30,
                child: Icon(
                  Icons.arrow_forward,
                  color: Colors.white,
                ),
              ),
            ),
          ),

          /*------------------------------
         Switch Tab
          -------------------------------*/
          AnimatedPositioned(
            duration: Duration(seconds: 1),
            top: _isLoaded
                ? -SizeConfig.getPercentageHeight(12)
                : SizeConfig.getPercentageHeight(25),
            right: 0,
            left: 0,
            child: Stack(
              alignment: AlignmentDirectional.center,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(
                      horizontal: SizeConfig.getPercentageWidth(5)),
                  width: SizeConfig.getPercentageWidth(100),
                  height: SizeConfig.getPercentageHeight(5),
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: ColorConfig.B30),
                      borderRadius: BorderRadius.circular(20)),
                  child: Row(
                    children: [
                      ...List.generate(
                          2,
                          (index) => Expanded(
                              child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      activeIndex = index;
                                      index == 0
                                          ? _login = true
                                          : _login = false;
                                    });
                                  },
                                  child: Container(
                                      color: Colors.transparent,
                                      child: Center(
                                          child: Text(
                                        authData[index],
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600),
                                      ))))))
                    ],
                  ),
                ),
                AnimatedPositioned(
                    left: _login
                        ? SizeConfig.getPercentageWidth(5)
                        : SizeConfig.getPercentageWidth(45),
                    child: Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: SizeConfig.getPercentageWidth(1)),
                      padding: EdgeInsets.symmetric(
                          vertical: SizeConfig.getPercentageHeight(1)),
                      width: SizeConfig.getPercentageWidth(48),
                      decoration: BoxDecoration(
                          color: ColorConfig.primary,
                          border: Border.all(width: 1, color: ColorConfig.B30),
                          borderRadius: BorderRadius.circular(20)),
                      child: Center(
                          child: Text(
                        authData[activeIndex],
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w600),
                      )),
                    ),
                    duration: Duration(milliseconds: 500)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
