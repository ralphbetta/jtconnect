import 'dart:async';

import 'package:flutter/material.dart';
import 'package:jtconnect/config/assets.dart';
import 'package:jtconnect/config/color.dart';
import 'package:jtconnect/config/size.dart';
import 'package:jtconnect/config/style.dart';
import 'package:jtconnect/constants/controllers.dart';
import 'package:jtconnect/constants/country.dart';
import 'package:jtconnect/screens/authentication/login.dart';

class InputField extends StatefulWidget {
  const InputField({
    Key? key,
    this.controller,
    this.dataset,
    this.selected,
    this.intialValue,
    this.label,
    required this.title,
    this.onChange,
    this.onSelect,
    this.borderColor,
    required this.errorMessage,
    this.marginTop = 0.0,
    this.marginBottom = 0.0,
    this.isPhone = false,
    this.secured = false,
  }) : super(key: key);

  final TextEditingController? controller;
  final String title;
  final String? selected;
  final Map? dataset;
  final String? intialValue;
  final double marginTop;
  final double marginBottom;
  final String? label;
  final Color? borderColor;
  final String errorMessage;
  final Function? onChange;
  final Function(String?)? onSelect;
  final bool isPhone;
  final bool secured;

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  String pickedCountry = "Afghanistan";

  @override
  void initState() {
    loadCustomCountry();
    super.initState();
  }

  bool setCountry = false;

  void loadCustomCountry() {
    setState(() {
      filteredCountry = supportedCountries.take(5).toList();
    });
  }

  List<Map> filteredCountry = [];

  bool visible = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: SizeConfig.getPercentageHeight(widget.marginTop),
          bottom: SizeConfig.getPercentageHeight(widget.marginBottom)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          widget.label == null
              ? Container()
              : Padding(
                  padding: EdgeInsets.only(
                      bottom: SizeConfig.getPercentageHeight(0.9)),
                  child: Text(
                    widget.label!,
                    style: StyleConfig.customStyle(),
                  ),
                ),
          Row(
            children: [
              widget.isPhone
                  ? GestureDetector(
                      onTap: () {
                        setState(() {
                          setCountry = !setCountry;
                        });
                        widget.onChange!(setCountry);
                      },
                      child: Container(
                          width: SizeConfig.getPercentageWidth(16),
                          padding: EdgeInsets.symmetric(
                              vertical: SizeConfig.getPercentageWidth(2.8)),
                          decoration: BoxDecoration(
                              color: ColorConfig.B20,
                              border: Border.all(
                                width: 1,
                                color: ColorConfig.B70,
                              ),
                              borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(4),
                                  bottomLeft: Radius.circular(4))),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Image(
                                image: AssetImage(AssetConfig.getFromFlag(
                                    supportedCountries
                                            .where((element) =>
                                                element['name'] ==
                                                pickedCountry)
                                            .first['isoCode']
                                            .toString() +
                                        ".png")),
                                width: 25,
                              ),
                              const Icon(
                                Icons.arrow_drop_down,
                              )
                            ],
                          )),
                    )
                  : Container(),
              Expanded(
                child: Container(
                    margin: EdgeInsets.symmetric(
                      vertical: SizeConfig.getPercentageWidth(1),
                    ),
                    padding: EdgeInsets.only(
                      left: SizeConfig.getPercentageWidth(3),
                    ),
                    decoration: BoxDecoration(
                        border: Border.all(
                          width: 1,
                          color: widget.borderColor ?? ColorConfig.B70,
                        ),
                        borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(4),
                            bottomRight: Radius.circular(4))),
                    child: TextFormField(
                      controller:
                          widget.intialValue != null ? null : widget.controller,
                      // ignore: prefer_if_null_operators
                      initialValue: widget.intialValue,
                      keyboardType: TextInputType.text,
                      obscureText: widget.secured
                          ? visible
                              ? true
                              : false
                          : false,
                      decoration: formDecoration(
                        widget.title,
                        true,
                        null,
                      ),
                      //onChanged: widget.onChange, //(String? value) {},
                    )),
              ),
            ],
          ),
          setCountry
              ? Container(
                  width: SizeConfig.getPercentageWidth(100),
                  height: SizeConfig.getPercentageWidth(50),
                  margin: EdgeInsets.symmetric(
                      horizontal: SizeConfig.getPercentageWidth(1)),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: [
                        BoxShadow(
                            color: ColorConfig.B30,
                            blurRadius: 10.5,
                            offset: Offset(1, -1),
                            spreadRadius: 0.2)
                      ]),
                  child: Column(
                    children: [
                      TextField(
                        autofocus: false,
                        decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: "Search for countries",
                            prefixIcon: Icon(Icons.search_rounded)),
                        textAlign: TextAlign.left,
                        keyboardType: TextInputType.text,
                        style: const TextStyle(),
                        maxLines: 1,
                        onChanged: (value) {
                          if (value.length > 0) {
                            print(value);
                            print(filteredCountry);
                            setState(() {
                              filteredCountry = supportedCountries
                                  .where((element) => element['name']
                                      .toString()
                                      .toLowerCase()
                                      .contains(value))
                                  .toList();
                            });
                          }
                        },
                      ),
                      Expanded(
                        child: Container(
                            child: ListView.builder(
                                padding: EdgeInsets.zero,
                                itemCount: filteredCountry.length,
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        pickedCountry =
                                            filteredCountry[index]['name'];

                                        phoneController.text =
                                            filteredCountry[index]['dialCode'];
                                      });

                                      Timer(const Duration(milliseconds: 100),
                                          () {
                                        setState(() {
                                          setCountry = false;
                                        });
                                        widget.onChange!(setCountry);
                                      });
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Row(
                                        children: [
                                          Image(
                                            image: AssetImage(
                                                AssetConfig.getFromFlag(
                                              filteredCountry[index]
                                                      ['isoCode'] +
                                                  ".png",
                                            )),
                                            width:
                                                SizeConfig.getPercentageWidth(
                                                    8),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: SizeConfig
                                                    .getPercentageWidth(3)),
                                            child: Text(
                                              filteredCountry[index]['name'],
                                              style: TextStyle(),
                                            ),
                                          ),
                                          Text(
                                              "[${filteredCountry[index]['dialCode']}]"),
                                          Expanded(child: Container()),
                                          filteredCountry[index]['name'] ==
                                                  pickedCountry
                                              ? const Icon(Icons.check)
                                              : Container(),
                                        ],
                                      ),
                                    ),
                                  );
                                })),
                      )
                    ],
                  ))
              : Container(),
          widget.errorMessage.isEmpty
              ? Container()
              : Padding(
                  padding: EdgeInsets.only(
                      bottom: SizeConfig.getPercentageHeight(0.0)),
                  child: Text(
                    widget.errorMessage,
                    style: TextStyle(color: Colors.red),
                  ),
                ),
        ],
      ),
    );
  }

  InputDecoration formDecoration(String text, bool _pass, Icon? display) {
    return InputDecoration(
        hintText: text,
        hintStyle: const TextStyle(
          fontSize: 18,
        ),
        enabledBorder: InputBorder.none,
        focusedBorder: InputBorder.none,
        suffixIcon: widget.secured
            ? IconButton(
                onPressed: () {
                  setState(() {
                    visible = !visible;
                  });
                },
                icon: visible
                    ? Icon(Icons.visibility)
                    : Icon(Icons.visibility_off))
            : null);
  }
}

enum formErrorState { passed, failed, none }

Color formStateColor(formErrorState state) {
  switch (state) {
    case formErrorState.passed:
      return Colors.green;
    case formErrorState.failed:
      return Colors.red;
    default:
      return Colors.black45;
  }
}
