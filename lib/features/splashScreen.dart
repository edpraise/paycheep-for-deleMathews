import 'dart:async';

import 'package:bankx/constant/constant.dart';
import 'package:bankx/features/authentication/Login/view/signin.dart';

import 'package:flutter/material.dart';





class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double width;
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 10),
      () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SignIn(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xFF0A043C),
      body: Stack(
        children: [
          icon(),
          loader(),
        ],
      ),
    );
  }

  icon() {
    return Center(
      child: Container(
        width: 300.0,
        height: 300.0,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/user/ps.png'),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  loader() {
    return Positioned(
      bottom: 40.0,
      child: Container(
        width: width,
        alignment: Alignment.center,
        child: SizedBox(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(primaryColor),
            strokeWidth: 2.0,
          ),
          height: 50.0,
          width: 50.0,
        ),
      ),
    );
  }
}
