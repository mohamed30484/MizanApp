import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mizan_app/core/constants/mizan_app_constants.dart';
import 'package:mizan_app/core/database/cache_helper.dart';
import 'package:mizan_app/widgets/custom_container_expense1.dart';
import 'package:mizan_app/widgets/custom_container_expenses2.dart';
import 'package:mizan_app/widgets/custom_container_expenses3.dart';

import 'package:mizan_app/widgets/custom_precent_circle_avatar.dart';

class OraganizeExpenses extends StatefulWidget {
  OraganizeExpenses({super.key, required this.sallary});
  String sallary;

  @override
  State<OraganizeExpenses> createState() => _OraganizeExpensesState();
}

class _OraganizeExpensesState extends State<OraganizeExpenses> {
  late double sallary;

  @override
  void initState() {
    super.initState();
    sallary = CacheHelper.loudsallary();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 70),
              child: Text(
                'ميزان',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: MediaQuery.of(context).size.width * 0.10,
                  fontWeight: FontWeight.bold,
                  fontFamily: kfontStyle4,
                ),
              ),
            ),
          ],
        ),
      ),

      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0, top: 2),
            child: Row(
              textDirection: TextDirection.rtl,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: MediaQuery.of(context).size.width * 0.08,
                  backgroundImage: const AssetImage('assets/logo (2).png'),
                ),

                Transform.translate(
                  offset: const Offset(-15, 30),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.7,
                    height: MediaQuery.of(context).size.height * 0.15,
                    margin: const EdgeInsets.only(bottom: 10.0),
                    padding: const EdgeInsets.only(right: 10.0, top: 10.0),
                    decoration: BoxDecoration(
                      color: kPrimaryColor2,
                      borderRadius: const BorderRadiusDirectional.only(
                        topStart: Radius.circular(15.0),
                        bottomStart: Radius.circular(15.0),
                        bottomEnd: Radius.circular(15.0),
                      ),
                    ),
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.topRight,
                            child: Text(
                              'في هذه الفحة يتم عرض أفضل نسبة لتنظيم المصروفات من خلال مرتبك',
                              textAlign: TextAlign.end,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.045,
                                fontWeight: FontWeight.bold,
                                fontFamily: kfontStyle2,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.width * 0.10),
          Container(
            width: MediaQuery.of(context).size.width * 0.60,
            height: MediaQuery.of(context).size.width * 0.18,
            decoration: BoxDecoration(
              color: kPrimaryColor3,
              borderRadius: BorderRadius.circular(25),
            ),
            child: Center(
              child: Text(
                sallary.toString(),
                style: TextStyle(
                  color: kPrimaryColor,
                  fontSize: MediaQuery.of(context).size.width * 0.06,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.width * 0.04),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,

            child: Row(
              children: [
                CusromContainerExpenses3(widget: widget),
                SizedBox(width: MediaQuery.of(context).size.width * 0.04),
                CustomContainerExpenses2(widget: widget),
                SizedBox(width: MediaQuery.of(context).size.width * 0.04),
                CustomContainerExpense1(widget: widget),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
