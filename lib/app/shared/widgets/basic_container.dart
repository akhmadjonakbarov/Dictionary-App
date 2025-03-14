import 'package:flutter/material.dart';

import '../../ui/app_colors.dart';
import '../../utils/radius_manager.dart';

class BasicContainer extends StatelessWidget {
  const BasicContainer({
    super.key,
    this.decoration,
    this.alignment,
    this.child,
    this.margin,
    this.padding,
    this.height,
    this.width,
    required this.onClick,
  });

  final BoxDecoration? decoration;
  final Alignment? alignment;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final Widget? child;
  final double? height;
  final double? width;
  final Function() onClick;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Container(
        height: height,
        alignment: alignment ?? Alignment.center,
        decoration: decoration ??
            BoxDecoration(
              color: AppColors.white,
              borderRadius: RadiusManager.circular(
                context: context,
              ),
              border: Border.all(
                color: AppColors.borderColor,
              ),
            ),
        padding: padding ?? EdgeInsets.symmetric(horizontal: 5, vertical: 8),
        margin: margin ??
            EdgeInsets.symmetric(
              horizontal: width! * 0.1 / 4,
              vertical: height! / 20,
            ),
        child: child,
      ),
    );
  }
}
