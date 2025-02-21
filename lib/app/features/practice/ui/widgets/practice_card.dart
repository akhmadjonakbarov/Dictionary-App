import 'package:dictionary_app/app/ui/app_colors.dart';
import 'package:dictionary_app/app/ui/app_icons.dart';
import 'package:dictionary_app/app/utils/radius_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../shared/widgets/responsive_widget.dart';

class PracticeCard extends StatelessWidget {
  const PracticeCard({
    super.key,
    required this.constraints,
    required this.height,
    required this.width,
    required this.firstLang,
    required this.secondLang,
    this.onClick,
  });

  final BoxConstraints constraints;
  final double height;
  final double width;
  final Function()? onClick;
  final Widget firstLang;
  final Widget secondLang;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Container(
        width: constraints.maxWidth * 0.48,
        height: height / 5,
        decoration: BoxDecoration(
          color: AppColors.white,
          border: Border.all(
            color: AppColors.borderColor,
          ),
          borderRadius: RadiusManager.circular(
            context: context,
          ),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              left: 0,
              top: 0,
              child: SvgPicture.asset(
                AppIcons.opacityBrain,
                height: height / 9,
              ),
            ),
            Positioned(
              right: 0,
              top: 0,
              child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.play_arrow_outlined,
                  size: height / 25,
                ),
              ),
            ),
            Positioned(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  firstLang,
                  Container(
                    margin: EdgeInsets.symmetric(
                      vertical: height / 65,
                    ),
                    child: SvgPicture.asset(
                      AppIcons.arrowDown,
                    ),
                  ),
                  secondLang,
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class PracticeLabelCard extends StatelessWidget {
  const PracticeLabelCard({
    super.key,
    required this.lang,
    this.textColor,
  });

  final String lang;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      builder: (ctx, width, height) => Text(
        lang,
        style: GoogleFonts.quicksand(
            fontWeight: FontWeight.w600,
            fontSize: height / 45,
            color: textColor),
      ),
    );
  }
}
