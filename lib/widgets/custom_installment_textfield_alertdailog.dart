import 'package:flutter/material.dart';
import 'package:mizan_app/core/constants/mizan_app_constants.dart';

class CustomInstallmentTextFieldAlertSailog extends StatelessWidget {
  const CustomInstallmentTextFieldAlertSailog({
    super.key,
    required this.controller,
    required this.labelText,
    required this.keyBoardType,
  });

  final TextEditingController controller;
  final String labelText;
  final TextInputType keyBoardType;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.75,
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: TextField(
          keyboardType: keyBoardType,
          textDirection: TextDirection.rtl,
          decoration: InputDecoration(
            focusColor: kPrimaryColor4,
            border: OutlineInputBorder(borderSide: BorderSide(width: 1)),
            labelText: labelText,
          ),
          controller: controller,
        ),
      ),
    );
  }
}
