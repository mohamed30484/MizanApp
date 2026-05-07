import 'package:flutter/material.dart';
import 'package:mizan_app/core/constants/mizan_app_constants.dart';

// ignore: must_be_immutable
class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.labelText,
    required this.controller,
    this.suffixIcon,
    required this.keyboardType,
    this.obscureText,
    this.onPressed,
    this.color,
  });

  final String labelText;
  final TextEditingController controller;
  final IconData? suffixIcon;
  final TextInputType keyboardType;
  final bool? obscureText;
  final void Function()? onPressed;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'this field is required';
        }
        return null;
      },
      obscureText: obscureText != null ? obscureText! : false,
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        suffixIcon: suffixIcon != null
            ? IconButton(
                icon: Icon(suffixIcon),
                color: color,
                onPressed: onPressed,
              )
            : null,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: kPrimaryColor3, width: 2.0),
        ),
        labelText: labelText,
        labelStyle: TextStyle(
          fontSize: MediaQuery.of(context).size.width * 0.05,
        ),
        border: OutlineInputBorder(),
      ),
    );
  }
}
