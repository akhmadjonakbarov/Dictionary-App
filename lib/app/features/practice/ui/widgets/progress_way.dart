
import 'package:flutter/material.dart';

import '../../../../ui/app_colors.dart';

class ProgressWay extends StatelessWidget {
  const ProgressWay({super.key, required this.width, required this.height});

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height / 52,
      width: width,
      decoration: BoxDecoration(
        color: AppColors.whiteSmoke,
      ),
    );
  }
}
