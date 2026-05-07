import 'package:flutter/material.dart';
import 'package:mizan_app/core/constants/mizan_app_constants.dart';
import 'package:mizan_app/screens/oraganize_expenses.dart';
import 'package:mizan_app/widgets/custom_precent_circle_avatar.dart';

class CustomContainerExpense1 extends StatelessWidget {
  const CustomContainerExpense1({super.key, required this.widget});

  final OraganizeExpenses widget;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.50,
      height: MediaQuery.of(context).size.width * 1.07,
      decoration: BoxDecoration(
        color: kPrimaryColor,
        borderRadius: BorderRadius.circular(25),
        border: Border.all(color: Colors.black, width: 5),
      ),
      child: Column(
        children: [
          Text(
            'مصروفاتك',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontSize: MediaQuery.of(context).size.width * 0.052,
              fontWeight: FontWeight.w800,
              fontFamily: kfontStyle3,
            ),
          ),
          Text(
            'الاساسية الثابتة',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontSize: MediaQuery.of(context).size.width * 0.052,
              fontWeight: FontWeight.w800,
              fontFamily: kfontStyle3,
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.width * 0.05),

          AnimatedPercentageCircle(percent: 50, result: widget.sallary),

          SizedBox(height: MediaQuery.of(context).size.height * 0.05),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(width: MediaQuery.of(context).size.width * 0.04),
              Expanded(
                child: Text(
                  'فواتير الكهرباء والمياه',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: MediaQuery.of(context).size.width * 0.039,
                    fontWeight: FontWeight.bold,
                    fontFamily: kfontStyle3,
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(right: 9),
                child: Image.asset(
                  'assets/l1.png',
                  width: MediaQuery.of(context).size.width * 0.04,
                ),
              ),
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(width: MediaQuery.of(context).size.width * 0.12),
              Expanded(
                child: Text(
                  'مصاريف التعليم',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: MediaQuery.of(context).size.width * 0.039,
                    fontWeight: FontWeight.bold,
                    fontFamily: kfontStyle3,
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(right: 9),
                child: Image.asset(
                  'assets/l2.png',
                  width: MediaQuery.of(context).size.width * 0.04,
                ),
              ),
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(width: MediaQuery.of(context).size.width * 0.15),
              Expanded(
                child: Text(
                  'الرعاية الصحية',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: MediaQuery.of(context).size.width * 0.039,
                    fontWeight: FontWeight.bold,
                    fontFamily: kfontStyle3,
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(right: 9),
                child: Image.asset(
                  'assets/l3.png',
                  width: MediaQuery.of(context).size.width * 0.04,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(width: MediaQuery.of(context).size.width * 0.31),
              Expanded(
                child: Text(
                  'النقل',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: MediaQuery.of(context).size.width * 0.039,
                    fontWeight: FontWeight.bold,
                    fontFamily: kfontStyle3,
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(right: 9),
                child: Image.asset(
                  'assets/l4.png',
                  width: MediaQuery.of(context).size.width * 0.04,
                ),
              ),
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(width: MediaQuery.of(context).size.width * 0.26),
              Expanded(
                child: Text(
                  'الاتصالات',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: MediaQuery.of(context).size.width * 0.035,
                    fontWeight: FontWeight.bold,
                    fontFamily: kfontStyle3,
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(right: 9),
                child: Image.asset(
                  'assets/l44.png',
                  width: MediaQuery.of(context).size.width * 0.04,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
