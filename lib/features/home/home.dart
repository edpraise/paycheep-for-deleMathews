import 'dart:async';
import 'package:animated/animated.dart';
import 'package:bankx/pages/home/flchart.dart';
import 'package:bankx/pages/screens.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final cardList = [
    {
      'accountType': 'Saving Account',
      'accountNumber': '0325 2365 1478',
      'balance': '1,899',
    },
    {
      'accountType': 'Current Account',
      'accountNumber': '5984 4562 3258',
      'balance': '15,098',
    },
  ];
  bool scaled = false;
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(milliseconds: 80),
      () => setState(() {
        scaled = true;
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: scaffoldBgColor,
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          'EduPay',
          style: TextStyle(color: mainColor),
        ),
        automaticallyImplyLeading: false,
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          cards(),
          FlChart(),
          transactionsAndFundtransfer(),
          InkWell(
            onTap: () => Navigator.push(
              context,
              PageTransition(
                duration: Duration(milliseconds: 500),
                type: PageTransitionType.rightToLeft,
                child: Loans(),
              ),
            ),
            child: bankServices(title: 'Loans', image: 'assets/loan.png'),
          ),
          InkWell(
            onTap: () => Navigator.push(
              context,
              PageTransition(
                duration: Duration(milliseconds: 500),
                type: PageTransitionType.rightToLeft,
                child: Deposits(),
              ),
            ),
            child:
                bankServices(title: 'Deposits', image: 'assets/deposite.png'),
          ),
          InkWell(
            onTap: () => Navigator.push(
              context,
              PageTransition(
                duration: Duration(milliseconds: 500),
                type: PageTransitionType.rightToLeft,
                child: Cards(),
              ),
            ),
            child: bankServices(title: 'Cards', image: 'assets/cards.png'),
          ),
          bankServices(title: 'All Services', image: 'assets/more.png'),
          height20Space,
          businessLoan(),
          height20Space,
          educationLoan(),
          height20Space,
        ],
      ),
    );
  }

  educationLoan() {
    return InkWell(
      onTap: () => Navigator.push(
        context,
        PageTransition(
          duration: Duration(milliseconds: 500),
          type: PageTransitionType.rightToLeft,
          child: BusinessLoan(),
        ),
      ),
      child: Container(
        height: 100,
        margin: EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/education-loan.jpg'),
            fit: BoxFit.fill,
          ),
          boxShadow: [
            BoxShadow(
              spreadRadius: 1.0,
              blurRadius: 4.0,
              color: greyColor.withOpacity(0.5),
            ),
          ],
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }

  businessLoan() {
    return InkWell(
      onTap: () => Navigator.push(
        context,
        PageTransition(
          duration: Duration(milliseconds: 500),
          type: PageTransitionType.rightToLeft,
          child: BusinessLoan(),
        ),
      ),
      child: Container(
        height: 170,
        margin: EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/business-loan.jpg'),
            fit: BoxFit.fill,
          ),
          boxShadow: [
            BoxShadow(
              spreadRadius: 1.0,
              blurRadius: 4.0,
              color: greyColor.withOpacity(0.5),
            ),
          ],
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }

  bankServices({title, image}) {
    return Container(
      margin: EdgeInsets.only(
        left: fixPadding * 2.0,
        right: fixPadding * 2.0,
        top: fixPadding * 2.0,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: fixPadding,
        vertical: fixPadding,
      ),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            spreadRadius: 1.0,
            blurRadius: 4.0,
            color: greyColor.withOpacity(0.5),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            height: 45.0,
            width: 45.0,
            padding: EdgeInsets.all(fixPadding),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: whiteColor,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  spreadRadius: 1.0,
                  blurRadius: 4.0,
                  color: greyColor.withOpacity(0.5),
                ),
              ],
            ),
            child: Image.asset(image),
          ),
          widthSpace,
          Text(
            title,
            style: black16BoldTextStyle,
          ),
        ],
      ),
    );
  }

  transactionsAndFundtransfer() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
      child: Row(
        children: [
          Expanded(
            child: InkWell(
              onTap: () => Navigator.push(
                context,
                PageTransition(
                  duration: Duration(milliseconds: 500),
                  type: PageTransitionType.rightToLeft,
                  child: Transactions(),
                ),
              ),
              child: transactionsOrTransfer(title: 'Transactions'),
            ),
          ),
          widthSpace,
          Expanded(
            child: InkWell(
              onTap: () => Navigator.push(
                context,
                PageTransition(
                  duration: Duration(milliseconds: 500),
                  type: PageTransitionType.rightToLeft,
                  child: FundTransfer(),
                ),
              ),
              child: transactionsOrTransfer(title: 'Fund Transfer'),
            ),
          ),
        ],
      ),
    );
  }

  transactionsOrTransfer({title}) {
    return Container(
      padding: EdgeInsets.all(fixPadding * 2.0),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            spreadRadius: 1.0,
            blurRadius: 4.0,
            color: greyColor.withOpacity(0.5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: black14MediumTextStyle,
          ),
          heightSpace,
          Container(
            height: 20.0,
            width: 20.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: whiteColor,
              boxShadow: [
                BoxShadow(
                  spreadRadius: 1.0,
                  blurRadius: 3.0,
                  color: greyColor.withOpacity(0.5),
                ),
              ],
            ),
            alignment: Alignment.center,
            child: Icon(
              Icons.arrow_forward,
              size: 15.0,
              color: blackColor,
            ),
          ),
        ],
      ),
    );
  }

  cards() {
    return Container(
      height: 136,
      width: double.infinity,
      margin: EdgeInsets.only(
        top: fixPadding * 2.0,
      ),
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: cardList.length,
        itemBuilder: (context, index) {
          final card = cardList[index];
          return Animated(
            value: scaled ? 1 : 0.5,
            curve: Curves.easeInOut,
            duration: Duration(milliseconds: 300),
            builder: (context, child, animation) => Transform.scale(
              scale: animation.value,
              child: child,
            ),
            child: Container(
              width: 270.0,
              margin: (index != cardList.length - 1)
                  ? EdgeInsets.only(left: 20.0)
                  : EdgeInsets.only(left: 20.0, right: 20.0),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/bg.jpg'),
                  fit: BoxFit.fill,
                ),
                borderRadius: BorderRadius.circular(fixPadding),
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: blackColor.withOpacity(0.40),
                  borderRadius: BorderRadius.circular(fixPadding),
                ),
                padding: EdgeInsets.all(fixPadding + 5.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      card['accountType'],
                      style: white14MediumTextStyle,
                    ),
                    heightSpace,
                    Text(
                      card['accountNumber'],
                      style: white16BoldTextStyle,
                    ),
                    heightSpace,
                    Text(
                      '\$${card['balance']}',
                      style: white18BoldTextStyle,
                    ),
                    heightSpace,
                    Text(
                      'Statement',
                      style: primaryColor14RegularTextStyle,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
