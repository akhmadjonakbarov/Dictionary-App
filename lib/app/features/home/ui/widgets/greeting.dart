
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../ui/app_colors.dart';
import '../../../../ui/app_icons.dart';

class Greeting extends StatelessWidget {
  final double height;

  const Greeting({super.key, required this.height});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: height / 75),
          child: RichText(
            text: TextSpan(
              text: "Welcome",
              style: GoogleFonts.inter(
                fontSize: height / 40,
                color: AppColors.grey,
              ),
              children: [
                TextSpan(text: '\n'),
                TextSpan(
                  text: 'Best Stud1x',
                  style: GoogleFonts.inter(
                      fontWeight: FontWeight.w600,
                      color: AppColors.third,
                      fontSize: height / 25),
                )
              ],
            ),
          ),
        ),
        Container(
          alignment: Alignment.centerRight,
          child: SvgPicture.asset(AppIcons.brain),
        )
      ],
    );
  }
}
