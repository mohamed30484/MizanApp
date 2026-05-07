import 'package:flutter/material.dart';
import 'package:mizan_app/core/constants/mizan_app_constants.dart';

class CustomMizanMenuContainer extends StatelessWidget {
  const CustomMizanMenuContainer({
    super.key,
    required this.title,
    required this.imagePath,
    required this.onTap,
  });

  final String title;
  final String imagePath;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.96,
        height: MediaQuery.of(context).size.height * 0.15,
        padding: const EdgeInsets.only(right: 8.0, left: 15.0),
        decoration: BoxDecoration(
          color: kPrimaryColor6,
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Row(
          textDirection: TextDirection.rtl,
          children: [
            Expanded(
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: MediaQuery.of(context).size.width * 0.07,
                    fontWeight: FontWeight.w400,
                    fontFamily: kfontStyle1,
                  ),
                ),
              ),
            ),
            SizedBox(width: MediaQuery.of(context).size.width * 0.05),
            CircleAvatar(
              radius: MediaQuery.of(context).size.width * 0.12,
              backgroundImage: AssetImage(imagePath),
            ),
          ],
        ),
      ),
    );
  }
}
