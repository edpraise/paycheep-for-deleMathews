import 'package:bankx/features/authentication/Login/view/signin.dart';
import 'package:bankx/features/screens.dart';
import 'package:flutter/services.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  GlobalKey<FormState> _formState = GlobalKey<FormState>();
  TextEditingController nameCtrl = TextEditingController();
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController phoneCtrl = TextEditingController();
  TextEditingController businessNameCtrl = TextEditingController();
  TextEditingController countryCtrl = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      body: Form(
        key: _formState,
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            Column(
              children: [
                bankXWithImage(),
                height20Space,
                Text(
                  'Register your account',
                  style: black14MediumTextStyle,
                ),
                height20Space,
                customerNameTextField(),
                height20Space,
                customerEmailTextField(),
                height20Space,
                accountNumberTextField(),
                height20Space,
                customerBusinessTextField(),
                height20Space,
                customerCountryTextField(),
                height20Space,
                passwordTextField(),
                height20Space,
                countinueButton(),
                height20Space,
                InkWell(
                  onTap: () => Navigator.pop(context),
                  child: Text(
                    'Already registered?',
                    style: black16MediumTextStyle,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  bankXWithImage() {
    return Stack(
      children: [
        Container(
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
              'PayCheep',
              style: white36BoldTextStyle,
            ),
          ),
        ),
        Positioned(
          top: 10.0,
          left: 10.0,
          child: IconButton(
            onPressed: () => Navigator.pop(context),
            iconSize: 24.0,
            color: whiteColor,
            icon: Icon(
              Icons.arrow_back,
            ),
          ),
        ),
      ],
    );
  }

  countinueButton() {
    return InkWell(
      onTap: () => Navigator.push(
        context,
        PageTransition(
          duration: Duration(milliseconds: 500),
          type: PageTransitionType.rightToLeft,
          child: SignIn(),
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
          style: TextStyle(color: mainColor),
        ),
      ),
    );
  }

  customerNameTextField() {
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
      child: TextFormField(
        controller: nameCtrl,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Field cannot be empty';
          }
          return null;
        },
        cursorColor: Colors.black,
        style: TextStyle(color: Colors.black),
        decoration: InputDecoration(
          hintStyle: TextStyle(color: Colors.black),
          hintText: 'Name',
          border: InputBorder.none,
        ),
      ),
    );
  }

  customerEmailTextField() {
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
      child: TextFormField(
        controller: emailCtrl,
         validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Field cannot be empty';
          }
          return null;
        },
        cursorColor: Colors.black,
        style: TextStyle(color: Colors.black),
        decoration: InputDecoration(
          hintStyle: TextStyle(color: Colors.black),
          hintText: 'Email',
          border: InputBorder.none,
        ),
      ),
    );
  }

  accountNumberTextField() {
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
      child: TextFormField(
        controller: passwordCtrl,
         validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Field cannot be empty';
          }
          return null;
        },
        keyboardType: TextInputType.number,
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.digitsOnly
        ],
        cursorColor: Colors.black,
        style: TextStyle(color: Colors.black),
        decoration: InputDecoration(
          hintStyle: TextStyle(color: Colors.black),
          hintText: 'Phone Number',
          border: InputBorder.none,
        ),
      ),
    );
  }

  customerBusinessTextField() {
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
      child: TextFormField(
        controller: businessNameCtrl,
         validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Field cannot be empty';
          }
          return null;
        },
        cursorColor: Colors.black,
        style: TextStyle(color: Colors.black),
        decoration: InputDecoration(
          hintStyle: TextStyle(color: Colors.black),
          hintText: 'Business Name',
          border: InputBorder.none,
        ),
      ),
    );
  }

  customerCountryTextField() {
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
      child: TextFormField(
        controller: countryCtrl,
         validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Field cannot be empty';
          }
          return null;
        },
        cursorColor: Colors.black,
        style: TextStyle(color: Colors.black),
        decoration: InputDecoration(
          hintStyle: TextStyle(color: Colors.black),
          hintText: 'Country',
          border: InputBorder.none,
        ),
      ),
    );
  }

  passwordTextField() {
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
      child: TextFormField(
        controller: passwordCtrl,
         validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Field cannot be empty';
          }
          return null;
        },
        obscureText: true,
        cursorColor: Colors.black,
        style: TextStyle(color: Colors.black),
        decoration: InputDecoration(
          hintStyle: TextStyle(color: Colors.black),
          hintText: 'password',
          border: InputBorder.none,
        ),
      ),
    );
  }
}
