import 'package:flutter/material.dart';
import 'package:mizan_app/core/constants/mizan_app_constants.dart';
import 'package:mizan_app/screens/oraganize_expenses.dart';
import 'package:mizan_app/widgets/custom_precent_circle_avatar.dart';

class CusromContainerExpenses3 extends StatelessWidget {
  const CusromContainerExpenses3({super.key, required this.widget});

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
            'الادخارات',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontSize: MediaQuery.of(context).size.width * 0.052,
              fontWeight: FontWeight.w800,
              fontFamily: kfontStyle3,
            ),
          ),
          Text(
            'الاستثمارات',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontSize: MediaQuery.of(context).size.width * 0.052,
              fontWeight: FontWeight.w800,
              fontFamily: kfontStyle3,
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.width * 0.05),

          AnimatedPercentageCircle(percent: 20, result: widget.sallary),

          SizedBox(height: MediaQuery.of(context).size.height * 0.05),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(width: MediaQuery.of(context).size.width * 0.14),
              Expanded(
                child: Text(
                  'زيادة المدخرات',
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
                  'assets/l9.png',
                  width: MediaQuery.of(context).size.width * 0.04,
                ),
              ),
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(width: MediaQuery.of(context).size.width * 0.090),
              Expanded(
                child: Text(
                  'تعجيل سداد الديون',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: MediaQuery.of(context).size.width * 0.036,
                    fontWeight: FontWeight.bold,
                    fontFamily: kfontStyle3,
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(right: 9),
                child: Image.asset(
                  'assets/type.jpg',
                  width: MediaQuery.of(context).size.width * 0.03,
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
                  'حالات الطوارئء',
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
                  'assets/l10.png',
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
