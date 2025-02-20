
import 'package:flutter/material.dart';

import '../../../../ui/app_colors.dart';

class CircleItemButton extends StatelessWidget {
  final double width;
  final double height;
  final Widget child;
  final Function() onTap;

  const CircleItemButton({
    super.key,
    required this.height,
    required this.width,
    required this.child,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        height: height,
        width: width,
        decoration: BoxDecoration(
          border: Border.all(
            color: AppColors.black.withOpacity(0.2),
            width: 1,
          ),
          shape: BoxShape.circle,
        ),
        child: child,
      ),
    );
  }
}
