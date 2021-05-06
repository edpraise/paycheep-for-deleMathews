import 'dart:io';

import 'package:bankx/pages/screens.dart';
// import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:local_auth/local_auth.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final LocalAuthentication auth = LocalAuthentication();
  // bool _canCheckBiometrics;
  // List<BiometricType> _availableBiometrics;
  // String _authorized = 'Not authorized';
  bool tooManyAttempt = false;
  // bool _isFingerPrintBiometricAvailable;
  bool progress;
  bool cancelTapOnFingerprintDialog;
  DateTime currentBackPressTime;

  @override
  void initState() {
    super.initState();
  }

  // fingerPrintAuth() async {
  //   await _checkBiometrics();
  //   if (!_canCheckBiometrics) {
  //     setState(() {
  //       _authorized = 'Fingerprint Sensor Not Available';
  //     });
  //   }

  //   if (_canCheckBiometrics) {
  //     await _getAvailableBiometrics();
  //     for (int i = 0; i < _availableBiometrics.length; i++) {
  //       if (_availableBiometrics[i] == BiometricType.fingerprint) {
  //         _isFingerPrintBiometricAvailable = true;
  //       }
  //     }

  //     // if (!_isFingerPrintBiometricAvailable) {
  //     //   setState(() {
  //     //     _authorized = 'Fingerprint Sensor Available but Fingerprint Not Set.';
  //     //   });
  //     // }

  //     if (_isFingerPrintBiometricAvailable) {
  //       await _authenticate();
  //     }
  //   }
  // }

  // Future<void> _checkBiometrics() async {
  //   bool canCheckBiometrics;
  //   try {
  //     canCheckBiometrics = await auth.canCheckBiometrics;
  //   } on PlatformException catch (e) {
  //     canCheckBiometrics = false;
  //     print(e);
  //   }
  //   if (!mounted) return;

  //   setState(() {
  //     _canCheckBiometrics = canCheckBiometrics;
  //   });
  // }

  // Future<void> _getAvailableBiometrics() async {
  //   List<BiometricType> availableBiometrics;
  //   try {
  //     availableBiometrics = await auth.getAvailableBiometrics();
  //   } on PlatformException catch (e) {
  //     availableBiometrics = <BiometricType>[];
  //     print(e);
  //   }
  //   if (!mounted) return;

  //   setState(() {
  //     _availableBiometrics = availableBiometrics;
  //   });
  // }

  // Future<void> _authenticate() async {
  //   bool authenticated = false;
  //   String exceptionMsg;
  //   try {
  //     setState(() {
  //       _authorized = 'Authenticating';
  //     });
  //     authenticated = await auth.authenticateWithBiometrics(
  //       localizedReason: 'Scan your fingerprint to authenticate',
  //       useErrorDialogs: false,
  //       stickyAuth: true,
  //     );
  //     setState(() {
  //       _authorized = 'Authenticating';
  //     });
  //   } on PlatformException catch (e) {
  //     print(e);
  //     exceptionMsg = e.message;
  //   }
  //   if (!mounted) return;

  //   final String message = authenticated
  //       ? 'Fingerprint Authentication Successful.'
  //       : (exceptionMsg != null)
  //           ? exceptionMsg
  //           : 'Not authorize';
  //   if (authenticated) {
  //     tooManyAttempt = false;
  //     Navigator.push(
  //       context,
  //       PageTransition(
  //         duration: Duration(milliseconds: 500),
  //         type: PageTransitionType.rightToLeft,
  //         child: Register(),
  //       ),
  //     );
  //   }
  //   setState(() {
  //     _authorized = message;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      body: WillPopScope(
        onWillPop: () async {
          bool backStatus = onWillPop();
          if (backStatus) {
            exit(0);
          }
          return false;
        },
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            Column(
              children: [
                bankXWithImage(),
                height20Space,
                Text(
                  'Sign in your account',
                  style: black14MediumTextStyle,
                ),
                height20Space,
                customerIdTextField(),
                height20Space,
                mPinTextField(),
                height20Space,
                countinueButton(),
                height20Space,
                InkWell(
                  onTap: () => Navigator.push(
                    context,
                    PageTransition(
                      duration: Duration(milliseconds: 500),
                      type: PageTransitionType.rightToLeft,
                      child: Register(),
                    ),
                  ),
                  child: Text(
                    'New user? SignUp',
                    style: black16MediumTextStyle,
                  ),
                ),
                height20Space,
                height20Space,
                // Text(
                //   'Or scan your thumb to continue',
                //   style: black14MediumTextStyle,
                // ),
                height20Space,
                // InkWell(
                //   onTap: () => fingerPrintAuth(),
                //   child: Icon(
                //     Icons.fingerprint,
                //     size: 66.0,
                //     color: primaryColor,
                //   ),
                // ),
                // height20Space,
                // Text(
                //   _authorized,
                //   style: red14MediumTextStyle,
                // ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  bankXWithImage() {
    return Container(
      height: 200.0,
      decoration: BoxDecoration(
        color: blackColor,
        image: DecorationImage(
          image: AssetImage('assets/banking.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        color: blackColor.withOpacity(0.46),
        alignment: Alignment.center,
        child: Text(
          'EduPay',
          style: white36BoldTextStyle,
        ),
      ),
    );
  }

  countinueButton() {
    return InkWell(
      onTap: () => Navigator.push(
        context,
        PageTransition(
          duration: Duration(milliseconds: 500),
          type: PageTransitionType.rightToLeft,
          child: BottomBar(),
        ),
      ),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
        padding: EdgeInsets.symmetric(
          vertical: fixPadding + 4.0,
        ),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Text(
          'Continue',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  customerIdTextField() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
      padding: EdgeInsets.symmetric(
        horizontal: fixPadding + 5.0,
        vertical: fixPadding - 6.0,
      ),
      decoration: BoxDecoration(
        color: whiteColor,
        boxShadow: [
          BoxShadow(
            spreadRadius: 1.0,
            blurRadius: 4.0,
            color: greyColor.withOpacity(0.5),
          ),
        ],
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: TextField(
        cursorColor: primaryColor,
        style: TextStyle(color: Colors.black),
        decoration: InputDecoration(
          hintStyle: TextStyle(color: Colors.black),
          hintText: 'Customer ID',
          border: InputBorder.none,
        ),
      ),
    );
  }

  mPinTextField() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
      padding: EdgeInsets.symmetric(
        horizontal: fixPadding + 5.0,
        vertical: fixPadding - 6.0,
      ),
      decoration: BoxDecoration(
        color: whiteColor,
        boxShadow: [
          BoxShadow(
            spreadRadius: 1.0,
            blurRadius: 4.0,
            color: greyColor.withOpacity(0.5),
          ),
        ],
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: TextField(
        obscureText: true,
        cursorColor: primaryColor,
        style: TextStyle(color: Colors.black),
        decoration: InputDecoration(
          hintStyle: TextStyle(color: Colors.black),
          hintText: 'Enter mPin',
          border: InputBorder.none,
        ),
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
        backgroundColor: Colors.black,
        textColor: whiteColor,
      );
      return false;
    } else {
      return true;
    }
  }
}
