import 'dart:io';
import 'package:bankx/constant/constant.dart';
import 'package:bankx/features/account/account.dart';
import 'package:bankx/features/home/home.dart';
import 'package:bankx/features/notification/notification.dart';

import 'package:flutter/material.dart';

import 'package:fluttertoast/fluttertoast.dart';

class BottomBar extends StatefulWidget {
  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int currentIndex = 0;
  DateTime currentBackPressTime;

  changeIndex(index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldBgColor,
      bottomNavigationBar: Material(
        color: scaffoldBgColor,
        elevation: 2.0,
        child: Container(
          height: 50.0,
          child: BottomAppBar(
            color: scaffoldBgColor,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  getBottomBarItem(0, Icons.account_balance, 'Banking'),
                  getBottomBarItem(1, Icons.notifications, 'Notifications'),
                  getBottomBarItem(2, Icons.person, 'Account'),
                ],
              ),
            ),
          ),
        ),
      ),
      body: WillPopScope(
        onWillPop: () async {
          bool backStatus = onWillPop();
          if (backStatus) {
            exit(0);
          }
          return false;
        },
        child: (currentIndex == 0)
            ? Home()
            : (currentIndex == 1)
                ? Notifications()
                : Account(),
      ),
    );
  }

  onWillPop() {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime) > Duration(seconds: 2)) {
      currentBackPressTime = now;
      Fluttertoast.showToast(
        msg: 'Press Back Once Again to Exit.',
        backgroundColor: blackColor,
        textColor: whiteColor,
      );
      return false;
    } else {
      return true;
    }
  }

  getBottomBarItem(int index, icon, String text) {
    return InkWell(
      borderRadius: BorderRadius.circular(30.0),
      focusColor: primaryColor,
      onTap: () {
        changeIndex(index);
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon,
                size: 21.0,
                color: (currentIndex == index)
                    ? mainColor
                    : Color(0xFF0A043C).withOpacity(0.1)),
            height5Space,
            Text(
              text,
              style: (currentIndex == index)
                  ? primaryColor10RegularTextStyle
                  : grey10RegularTextStyle,
            ),
          ],
        ),
      ),
    );
  }
}
