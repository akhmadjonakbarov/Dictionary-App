import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../ui/app_colors.dart';

class LevelItem extends StatelessWidget {
  const LevelItem({
    super.key,
    required this.level,
    required this.constraints,
    required this.height,
    required this.isSelected,
    required this.onClick,
  });

  final String level;
  final BoxConstraints constraints;
  final double height;
  final Function(String value) onClick;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: constraints.maxWidth * 0.3,
      child: Material(
        borderRadius: BorderRadius.circular(
          height,
        ),
        child: Ink(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              height,
            ),
            border: Border.all(
              color: AppColors.borderColor,
            ),
          ),
          child: InkWell(
            borderRadius: BorderRadius.circular(height),
            onTap: () {
              onClick(level);
            },
            child: Center(
              child: Text(
                level.capitalizeFirst!,
                style: GoogleFonts.quicksand(
                  color: isSelected ? AppColors.third : AppColors.grey,
                  fontSize: height / 62,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
