import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../ui/app_colors.dart';
import '../../../../ui/app_icons.dart';
class ProgressLevel extends StatelessWidget {
  const ProgressLevel({
    super.key,
    required this.width,
    required this.height,
    required this.level,
  });

  final double width;
  final double height;
  final String level;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          height: height / 20,
          width: height / 20,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: AppColors.whiteSmoke,
            borderRadius: BorderRadius.circular(45),
          ),
          child: SvgPicture.asset(
            AppIcons.lock,
            alignment: Alignment.center,
            fit: BoxFit.contain, // or BoxFit.fill / BoxFit.scaleDown
          ),
        ),
        SizedBox(
          height: height * 0.1 / 15,
        ),
        Container(
          margin: EdgeInsets.only(),
          child: Text(
            level,
            style: GoogleFonts.quicksand(
                color: AppColors.grey, fontWeight: FontWeight.w600),
          ),
        )
      ],
    );
  }
}
