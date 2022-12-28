import 'package:flutter/material.dart';
import 'package:jtconnect/config/color.dart';
import 'package:jtconnect/config/size.dart';
import 'package:jtconnect/model/user.dart';
import 'package:jtconnect/screens/tab/screens/home.dart';
import 'package:jtconnect/screens/tab/screens/settings.dart';
import 'dart:math' as math;

import 'package:jtconnect/screens/tab/screens/transaction.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({super.key});

  @override
  State<TabScreen> createState() => _TabScreenState();
}

List<Widget> pages = [HomePage(), TransactionScreen(), SettingScreen()];

class _TabScreenState extends State<TabScreen> {
  double radius = 15.0;
  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarTextStyle: TextStyle(color: Colors.black87),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        actions: [
          SizedBox(
            width: SizeConfig.getPercentageWidth(5),
          ),
          CircleAvatar(
            radius: 18,
            backgroundColor: ColorConfig.primary,
            backgroundImage: AssetImage("assets/users/team2.jpeg"),
          ),
          SizedBox(
            width: SizeConfig.getPercentageWidth(2),
          ),
          Row(
            children: [
              Text(
                  "${UserModel.staticUsers.first.countryCode} ${UserModel.staticUsers.first.phone}"),
            ],
          ),
          Expanded(child: Container()),
          Stack(
            children: [
              Icon(
                Icons.notifications_outlined,
                color: Colors.black87,
                size: 28,
              ),
              Positioned(
                right: 6,
                top: 6,
                child: CircleAvatar(
                  radius: 3,
                  backgroundColor: Colors.red,
                ),
              )
            ],
          ),
          SizedBox(
            width: SizeConfig.getPercentageWidth(5),
          ),
        ],
      ),
      body: pages[activeIndex],
      bottomNavigationBar: BottomNavigationBar(
          onTap: (index) {
            setState(() {
              activeIndex = index;
            });
          },
          currentIndex: activeIndex,
          selectedItemColor: Theme.of(context).primaryColor,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.payments), label: "Transactions"),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: "Settings")
          ]),
    );
  }
}
