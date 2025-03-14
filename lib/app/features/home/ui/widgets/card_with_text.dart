import 'package:dictionary_app/app/ui/app_colors.dart';
import 'package:flutter/material.dart';

class CardWithText extends StatelessWidget {
  const CardWithText({
    super.key,
    required this.constraints,
    required this.height,
    required this.width,
    this.bgColor,
    this.child,
    required this.onClick,
  });

  final BoxConstraints constraints;
  final double height;
  final double width;
  final Function() onClick;
  final Color? bgColor;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Container(
        width: constraints.maxWidth * 0.45,
        height: height * 0.2,
        padding: EdgeInsets.all(height / 90),
        decoration: BoxDecoration(
          border: Border.all(
            color: AppColors.borderColor,
          ),
          borderRadius: BorderRadius.circular(height / 75),
          color: bgColor,
        ),
        child: child,
      ),
    );
  }
}
