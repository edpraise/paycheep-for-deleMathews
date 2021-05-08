
import 'package:bankx/features/screens.dart';
import 'package:bankx/widget/column_builder.dart';
import 'package:flutter/material.dart';

class LoanStatement extends StatefulWidget {
  final String loanType;
  final String number;
  final String dueAmount;
  final String emiAmount;
  LoanStatement({this.loanType, this.number, this.dueAmount, this.emiAmount});
  @override
  _LoanStatementState createState() => _LoanStatementState();
}

class _LoanStatementState extends State<LoanStatement> {
  double height;
  final transactionsList = [
    {
      'iscredit': false,
      'type': 'Auto debited EMI',
      'date': '2 April 2021',
      'amount': '912.00',
    },
    {
      'iscredit': false,
      'type': 'Auto debited EMI',
      'date': '2 March 2021',
      'amount': '912.00',
    },
    {
      'iscredit': false,
      'type': 'Auto debited EMI',
      'date': '2 Feb 2021',
      'amount': '912.00',
    },
    {
      'iscredit': false,
      'type': 'Auto debited EMI',
      'date': '2 Jan 2021',
      'amount': '912.00',
    },
    {
      'iscredit': false,
      'type': 'Auto debited EMI',
      'date': '2 Dec 2020',
      'amount': '912.00',
    },
    {
      'iscredit': false,
      'type': 'Auto debited EMI',
      'date': '2 Nov 2020',
      'amount': '912.00',
    },
    {
      'iscredit': false,
      'type': 'Auto debited EMI',
      'date': '2 Oct 2020',
      'amount': '912.00',
    },
    {
      'iscredit': true,
      'type': 'Disbursed amout credited',
      'date': '14 Sept 2020',
      'amount': '85,000.00',
    },
    {
      'iscredit': false,
      'type': 'Auto debited EMI',
      'date': '14 Sept 2020',
      'amount': '912.00',
    },
  ];
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: scaffoldBgColor,
      appBar: AppBar(
        backgroundColor: whiteColor,
        elevation: 1.0,
        centerTitle: true,
        title: Text(
          'Loan Statement',
          style: black18BoldTextStyle,
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: blackColor,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: fixPadding * 2.0,
              vertical: fixPadding * 2.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                loanInfo(),
                heightSpace,
                height5Space,
                Text(
                  'Recent transactions',
                  style: black16BoldTextStyle,
                ),
                transactions(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  transactions() {
    return ColumnBuilder(
      itemCount: transactionsList.length,
      itemBuilder: (context, index) {
        final transaction = transactionsList[index];
        return Padding(
          padding: EdgeInsets.only(
            top: (index == 0) ? fixPadding : fixPadding * 2.0,
            bottom:
                (index == transactionsList.length - 1) ? fixPadding * 2.0 : 0.0,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    height: 40.0,
                    width: 40.0,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: primaryColor.withOpacity(0.20),
                      shape: BoxShape.circle,
                      border: Border.all(color: primaryColor),
                    ),
                    child: Icon(
                      (transaction['iscredit'])
                          ? Icons.arrow_downward
                          : Icons.arrow_upward,
                      color: primaryColor,
                    ),
                  ),
                  widthSpace,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        transaction['type'],
                        style: black16MediumTextStyle,
                      ),
                      height5Space,
                      Text(
                        transaction['date'],
                        style: grey14MediumTextStyle,
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'USD',
                    style: black14MediumTextStyle,
                  ),
                  height5Space,
                  Text(
                    (transaction['iscredit'])
                        ? '+${transaction['amount']}'
                        : '-${transaction['amount']}',
                    style: black16BoldTextStyle,
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  loanInfo() {
    return Container(
      height: 150.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(fixPadding),
        image: DecorationImage(
          image: AssetImage('assets/bg.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        padding: EdgeInsets.all(fixPadding),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(fixPadding),
          color: blackColor.withOpacity(0.40),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.loanType,
                  style: white14BoldTextStyle,
                ),
                height5Space,
                Text(
                  widget.number,
                  style: white14MediumTextStyle,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Due Amount',
                      style: white12RegularTextStyle,
                    ),
                    height5Space,
                    Text(
                      '\$${widget.dueAmount}',
                      style: white16MediumTextStyle,
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'EMI',
                      style: white12RegularTextStyle,
                    ),
                    height5Space,
                    Text(
                      '\$${widget.emiAmount}',
                      style: white16MediumTextStyle,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
