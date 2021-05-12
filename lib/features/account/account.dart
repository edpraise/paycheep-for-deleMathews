import 'package:bankx/constant/constant.dart';
import 'package:bankx/features/authentication/Login/signin.dart';
import 'package:bankx/features/nearByAtms/nearByATM.dart';
import 'package:bankx/features/screens.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class Account extends StatefulWidget {
  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {
  var result;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldBgColor,
      appBar: AppBar(
        backgroundColor: whiteColor,
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          'Account',
          style: black18BoldTextStyle,
        ),
        automaticallyImplyLeading: false,
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          Padding(
            padding: EdgeInsets.all(fixPadding * 2.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                nameWithImageEdit(),
                height20Space,
                heightSpace,
                accountFunctionalities(
                  settingTitle: 'Change Pin',
                ),
                heightSpace,
                InkWell(
                  onTap: () => Navigator.push(
                    context,
                    PageTransition(
                      duration: Duration(milliseconds: 500),
                      type: PageTransitionType.rightToLeft,
                      child: NearByBanks(),
                    ),
                  ),
                  child: accountFunctionalities(
                    settingTitle: 'Nearby Banks',
                  ),
                ),
                heightSpace,
                InkWell(
                  onTap: () => Navigator.push(
                    context,
                    PageTransition(
                      duration: Duration(milliseconds: 500),
                      type: PageTransitionType.rightToLeft,
                      child: NearByATMs(),
                    ),
                  ),
                  child: accountFunctionalities(
                    settingTitle: 'Nearby ATMs',
                  ),
                ),
                heightSpace,
                height5Space,
                Text(
                  'ABOUT',
                  style: black12RegularTextStyle,
                ),
                heightSpace,
                height5Space,
                InkWell(
                  onTap: () => Navigator.push(
                    context,
                    PageTransition(
                      duration: Duration(milliseconds: 500),
                      type: PageTransitionType.rightToLeft,
                      child: Privacypolicy(),
                    ),
                  ),
                  child: accountFunctionalities(
                    settingTitle: 'Privacy Policy',
                  ),
                ),
                heightSpace,
                InkWell(
                  onTap: () => Navigator.push(
                    context,
                    PageTransition(
                      duration: Duration(milliseconds: 500),
                      type: PageTransitionType.rightToLeft,
                      child: TermOfUse(),
                    ),
                  ),
                  child: accountFunctionalities(
                    settingTitle: 'Terms of use',
                  ),
                ),
                heightSpace,
                height5Space,
                Text(
                  'APP',
                  style: black12RegularTextStyle,
                ),
                heightSpace,
                height5Space,
                InkWell(
                  onTap: () => Navigator.push(
                    context,
                    PageTransition(
                      duration: Duration(milliseconds: 500),
                      type: PageTransitionType.rightToLeft,
                      child: Support(),
                    ),
                  ),
                  child: accountFunctionalities(
                    settingTitle: 'Support',
                  ),
                ),
                heightSpace,
                accountFunctionalities(
                  settingTitle: 'Report a Bug',
                ),
                heightSpace,
                accountFunctionalities(
                  settingTitle: 'App Version 1.0',
                ),
                height20Space,
                logoutLink(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  nameWithImageEdit() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              width: 70.0,
              height: 70.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage('assets/user/user_9.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            widthSpace,
            Text(
              'Ellison Perry',
              style: black16BoldTextStyle,
            ),
          ],
        ),
        InkWell(
          onTap: () async {
            result = await Navigator.push(
              context,
              PageTransition(
                duration: Duration(milliseconds: 500),
                type: PageTransitionType.rightToLeft,
                child: EditProfile(),
              ),
            );
          },
          child: Container(
            height: 40.0,
            width: 40.0,
            alignment: Alignment.center,
            decoration: BoxDecoration(shape: BoxShape.circle, color: mainColor),
            child: Icon(
              Icons.edit,
              size: 24.0,
              color: whiteColor,
            ),
          ),
        ),
      ],
    );
  }

  logoutLink() {
    return InkWell(
      onTap: () => sureToLogoutDialog(),
      child: Row(
        children: [
          Icon(
            Icons.exit_to_app,
            color: Colors.black,
            size: 22.0,
          ),
          widthSpace,
          Text(
            'Logout',
            style: TextStyle(color: Colors.black),
          ),
        ],
      ),
    );
  }

  sureToLogoutDialog() {
    return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Dialog(
              insetPadding: EdgeInsets.symmetric(
                horizontal: fixPadding * 2.0,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(fixPadding),
                ),
              ),
              child: Wrap(
                children: [
                  Padding(
                    padding: EdgeInsets.all(fixPadding * 2.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'You sure want to logout?',
                          style: TextStyle(color: blackColor),
                        ),
                        height20Space,
                        Row(
                          children: [
                            Expanded(
                              child: InkWell(
                                onTap: () => Navigator.pop(context),
                                child: cancelOrLogout(
                                    selectionText: 'Cancel', isCancel: true),
                              ),
                            ),
                            width20Space,
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => SignIn(),
                                    ),
                                  );
                                },
                                child: cancelOrLogout(
                                    selectionText: 'Logout', isCancel: false),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  cancelOrLogout({selectionText, isCancel}) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(vertical: fixPadding - 5.0),
      decoration: BoxDecoration(
        color: (isCancel) ? blackColor : mainColor,
        border: (isCancel) ? Border.all(color: primaryColor) : Border(),
        borderRadius: BorderRadius.circular(fixPadding),
      ),
      child: Text(
        selectionText,
        style: (isCancel) ? black14MediumTextStyle : white14MediumTextStyle,
      ),
    );
  }

  accountFunctionalities({settingTitle}) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              settingTitle,
              style: TextStyle(color: Colors.black),
            ),
            Icon(
              Icons.keyboard_arrow_right,
              color: blackColor,
              size: 16.0,
            ),
          ],
        ),
        heightSpace,
        Container(
          height: 1.0,
          color: greyColor,
        ),
      ],
    );
  }
}
