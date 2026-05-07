import 'package:flutter/material.dart';
import 'package:mizan_app/core/constants/mizan_app_constants.dart';
import 'package:mizan_app/core/database/cache_helper.dart';

class AnimatedPercentageCircle extends StatefulWidget {
  final double percent;
  final String result;
  const AnimatedPercentageCircle({
    super.key,
    required this.percent,
    required this.result,
  });

  @override
  State<AnimatedPercentageCircle> createState() =>
      _AnimatedPercentageCircleState();
}

class _AnimatedPercentageCircleState extends State<AnimatedPercentageCircle> {
  Color getColor() {
    if (widget.percent <= 50) return kPrimaryColor6;

    return Colors.green;
  }

  double sallary = 0;
  double? result;

  @override
  void initState() {
    super.initState();
    sallary = CacheHelper.loudsallary();
    result = sallary * widget.percent / 100;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 120,
      height: 120,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: 150,
            height: 150,
            child: CircularProgressIndicator(
              value: 1,
              strokeWidth: 6,
              valueColor: AlwaysStoppedAnimation(Colors.grey.shade400),
            ),
          ),

          Container(
            width: 150,
            height: 150,
            child: TweenAnimationBuilder<double>(
              tween: Tween(begin: 0, end: widget.percent / 100),
              duration: const Duration(seconds: 1),
              builder: (context, value, _) {
                return CircularProgressIndicator(
                  value: value,
                  strokeWidth: 6,
                  valueColor: AlwaysStoppedAnimation(getColor()),
                  backgroundColor: Colors.transparent,
                );
              },
            ),
          ),

          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "${widget.percent.toInt()}%",
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),

              Text(
                result.toString(),
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
