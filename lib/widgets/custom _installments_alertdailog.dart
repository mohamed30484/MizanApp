import 'package:flutter/material.dart';
import 'package:mizan_app/core/constants/mizan_app_constants.dart';
import 'package:mizan_app/widgets/custom_installment_textfield_alertdailog.dart';

// ignore: must_be_immutable
class CustomAlertDailog extends StatelessWidget {
  CustomAlertDailog({
    super.key,

    required this.monthlyinstallment,
    required this.dateTime,
    required this.comments,
    required this.onPressedr,
    required this.buttontxtr,
    required this.buttontxtl,
    required this.onPressedl,
  });

  final TextEditingController monthlyinstallment;
  final TextEditingController dateTime;
  final TextEditingController comments;
  void Function() onPressedr;
  final String buttontxtr;
  void Function() onPressedl;
  final String buttontxtl;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: kPrimaryColor,

      title: Text(
        'اضافة القسط الشهري',
        style: TextStyle(
          fontWeight: FontWeight.w800,
          fontSize: MediaQuery.of(context).size.width * 0.05,
        ),
        textDirection: TextDirection.rtl,
      ),

      actions: [
        CustomInstallmentTextFieldAlertSailog(
          controller: monthlyinstallment,
          labelText: 'القسط الشهري',
          keyBoardType: TextInputType.numberWithOptions(decimal: true),
        ),
        SizedBox(height: MediaQuery.of(context).size.height * .03),
        CustomInstallmentTextFieldAlertSailog(
          controller: dateTime,
          labelText: 'الميعاد',
          keyBoardType: TextInputType.datetime,
        ),
        SizedBox(height: MediaQuery.of(context).size.height * .03),
        CustomInstallmentTextFieldAlertSailog(
          controller: comments,
          labelText: 'ملاحظات',
          keyBoardType: TextInputType.text,
        ),
        SizedBox(height: MediaQuery.of(context).size.height * .03),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: kPrimaryColor3,
                foregroundColor: Colors.white,
                shape: BeveledRectangleBorder(
                  borderRadius: BorderRadiusGeometry.circular(4),
                ),
              ),
              onPressed: onPressedl,
              child: Text(
                buttontxtl,
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width * .04,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                shape: BeveledRectangleBorder(
                  borderRadius: BorderRadiusGeometry.circular(4),
                ),
              ),
              onPressed: onPressedr,
              child: Text(
                buttontxtr,
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width * .04,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
