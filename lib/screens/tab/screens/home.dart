import 'package:flutter/material.dart';
import 'package:jtconnect/config/assets.dart';
import 'package:jtconnect/config/color.dart';
import 'package:jtconnect/config/size.dart';
import 'package:jtconnect/config/style.dart';
import 'package:jtconnect/model/user.dart';
import 'dart:math' as math;

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double radius = 15.0;
    return SingleChildScrollView(
        child: Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(
              horizontal: SizeConfig.getPercentageWidth(5),
              vertical: SizeConfig.getPercentageHeight(1)),
          padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.getPercentageWidth(5),
              vertical: SizeConfig.getPercentageHeight(2)),
          width: SizeConfig.getPercentageWidth(100),
          height: SizeConfig.getPercentageHeight(24),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(radius),
              color: Colors.amber,
              image: DecorationImage(
                  fit: BoxFit.fitHeight,
                  image: AssetImage(AssetConfig.getFromAssets("card1.png")))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Balance",
                style: StyleConfig.customStyle(color: Colors.grey, bold: true),
              ),
              SizedBox(
                height: SizeConfig.getPercentageHeight(1.3),
              ),
              Text(
                "\$${UserModel.staticUsers.first.balance}",
                style: StyleConfig.customStyle(
                    color: Colors.white, large: true, bold: true),
              ),
              SizedBox(
                height: SizeConfig.getPercentageHeight(8),
              ),
              Text(
                "You are able to carryout maintenance on",
                style: StyleConfig.customStyle(
                    color: Colors.white.withOpacity(0.8)),
              ),
              Expanded(
                child: SizedBox(
                  height: SizeConfig.getPercentageHeight(1.3),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Row(
                      children: [
                        Icon(
                          Icons.car_repair,
                          color: ColorConfig.primary,
                          size: 19,
                        ),
                        SizedBox(
                          width: SizeConfig.getPercentageWidth(2),
                        ),
                        Text(
                          "5 vehicles",
                          style: StyleConfig.customStyle(color: Colors.white54),
                        )
                      ],
                    ),
                  ),
                  Container(
                    child: Row(
                      children: [
                        Icon(
                          Icons.graphic_eq_sharp,
                          color: ColorConfig.primary,
                          size: 19,
                        ),
                        SizedBox(
                          width: SizeConfig.getPercentageWidth(2),
                        ),
                        Text(
                          "2 furnitures",
                          style: StyleConfig.customStyle(color: Colors.white54),
                        )
                      ],
                    ),
                  ),
                  Container(
                    child: Row(
                      children: [
                        Icon(
                          Icons.computer,
                          color: ColorConfig.primary,
                          size: 19,
                        ),
                        SizedBox(
                          width: SizeConfig.getPercentageWidth(2),
                        ),
                        Text(
                          "3 Electronics",
                          style: StyleConfig.customStyle(color: Colors.white54),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),

        /*--------------------------
         Special offer
        ----------------------------*/

        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.getPercentageWidth(5),
            vertical: SizeConfig.getPercentageWidth(2),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Special Offers",
                style: StyleConfig.customStyle(bold: true, fontSize: 20),
              ),
              TextButton(
                  onPressed: () {},
                  child: Text(
                    "See all",
                    style: TextStyle(color: Colors.grey),
                  ))
            ],
          ),
        ),

        /*--------------------------
         Special offer
        ----------------------------*/

        Container(
          width: SizeConfig.getPercentageWidth(100),
          height: SizeConfig.getPercentageHeight(37),
          padding:
              EdgeInsets.symmetric(vertical: SizeConfig.getPercentageHeight(1)),
          child: ListView.builder(
              itemCount: 5,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Stack(
                  children: [
                    Container(
                      width: SizeConfig.getPercentageWidth(52),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(radius),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 9,
                                spreadRadius: 10,
                                color: ColorConfig.B30.withOpacity(0.1)),
                          ]),
                      margin: EdgeInsets.only(
                          left: SizeConfig.getPercentageWidth(5)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    color: ColorConfig.B30,
                                    borderRadius:
                                        BorderRadius.circular(radius)),
                                child: Icon(
                                  Icons.car_repair_outlined,
                                  size: SizeConfig.getPercentageWidth(11),
                                ),
                                padding: EdgeInsets.all(7),
                                margin: EdgeInsets.only(
                                  left: SizeConfig.getPercentageWidth(5),
                                  top: SizeConfig.getPercentageWidth(5),
                                ),
                              )
                            ],
                          ),
                          Container(
                            margin: EdgeInsets.only(
                              top: SizeConfig.getPercentageHeight(2),
                              left: SizeConfig.getPercentageWidth(5),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Combo Service",
                                    style: TextStyle(
                                      color: ColorConfig.B100,
                                    )),
                                SizedBox(
                                  height: SizeConfig.getPercentageHeight(2),
                                ),
                                Text(
                                  "Inspection & \nMaintenance",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 19),
                                ),
                                SizedBox(
                                  height: SizeConfig.getPercentageHeight(1),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              left: SizeConfig.getPercentageWidth(5),
                              top: SizeConfig.getPercentageWidth(5),
                              bottom: SizeConfig.getPercentageWidth(3),
                            ),
                            child: RichText(
                                text: TextSpan(
                                    text: "\$8.20K",
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: ColorConfig.primary,
                                        fontWeight: FontWeight.bold),
                                    children: [
                                  TextSpan(
                                    text: "/ 30 Days",
                                    style: TextStyle(
                                        color: ColorConfig.B60,
                                        fontWeight: FontWeight.bold),
                                  )
                                ])),
                          ),

                          /*--------------------------
                          Button Section
                          ----------------------------*/
                          Center(
                            child: Container(
                              width: SizeConfig.getPercentageWidth(55),
                              margin: EdgeInsets.symmetric(
                                  vertical: SizeConfig.getPercentageWidth(2),
                                  horizontal: SizeConfig.getPercentageWidth(5)),
                              padding: EdgeInsets.symmetric(
                                vertical: SizeConfig.getPercentageWidth(3.5),
                              ),
                              decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius:
                                      BorderRadius.circular(radius / 2)),
                              child: Center(
                                child: Text(
                                  "Details",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Positioned(
                      right: 0,
                      child: Image(
                          height: SizeConfig.getShortestSide(17),
                          image: AssetImage(
                              AssetConfig.getFromIcons("Vector 1.png"))),
                    ),
                    Positioned(
                        right: 3,
                        top: 17,
                        child: Transform.rotate(
                          angle: math.pi / 4,
                          child: Text(
                            '7% OFF',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                          ),
                        ))
                  ],
                );
              }),
        )
      ],
    ));
  }
}
