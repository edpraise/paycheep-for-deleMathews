import 'package:bankx/features/screens.dart';


class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      body: ListView(
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
              customerIdTextField(),
              height20Space,
              accountNumberTextField(),
              height20Space,
              mPinTextField(),
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
              'EduPay',
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
          style: white16BoldTextStyle,
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
        style: black14MediumTextStyle,
        decoration: InputDecoration(
          hintStyle: black14MediumTextStyle,
          hintText: 'Customer ID',
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
      child: TextField(
        cursorColor: primaryColor,
        style: black14MediumTextStyle,
        decoration: InputDecoration(
          hintStyle: black14MediumTextStyle,
          hintText: 'Enter account number',
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
        cursorColor: primaryColor,
        style: black14MediumTextStyle,
        decoration: InputDecoration(
          hintStyle: black14MediumTextStyle,
          hintText: 'Enter mPin',
          border: InputBorder.none,
        ),
      ),
    );
  }
}
