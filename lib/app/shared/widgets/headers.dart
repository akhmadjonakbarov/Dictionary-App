import 'package:dictionary_app/app/core/screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../features/home/ui/widgets/circle_item_button.dart';
import '../../ui/app_colors.dart';
import '../../ui/app_icons.dart';

import 'responsive_widget.dart';

class TopBar extends StatelessWidget {
  final String title;

  final List<Widget>? children;

  const TopBar({
    super.key,
    required this.title,
    this.children,
  });

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      builder: (ctx, width, height) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () => Navigator.of(context).pop(),
              child: SvgPicture.asset(
                AppIcons.arrowBack,
                color: Colors.white,
              ),
            ),
            Text(
              title,
              style: GoogleFonts.montserrat(
                fontSize: height / 45,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox.shrink()
          ],
        );
      },
    );
  }
}

class Header extends StatelessWidget {
  const Header({
    super.key,
    required this.radius,
    required this.firstText,
    this.secondText,
    this.firstTextStyle,
    this.secondTextStyle,
    this.goToSetting,
  });

  final Radius radius;
  final String firstText;
  final String? secondText;
  final TextStyle? firstTextStyle;
  final TextStyle? secondTextStyle;
  final Function()? goToSetting;

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      builder: (ctx, width, height) => Container(
        padding: EdgeInsets.symmetric(
          horizontal: 5,
        ),
        height: height / 8,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.only(
            bottomLeft: radius,
            bottomRight: radius,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if (secondText != null)
              RichText(
                text: TextSpan(
                  style: firstTextStyle ??
                      GoogleFonts.quicksand(
                        fontSize: height / 40,
                        color: AppColors.grey,
                      ),
                  children: [
                    TextSpan(
                      text: firstText,
                    ),
                    TextSpan(
                      text: "\n",
                    ),
                    TextSpan(
                      text: secondText,
                      style: secondTextStyle ??
                          GoogleFonts.quicksand(
                              fontWeight: FontWeight.w600,
                              color: AppColors.third,
                              fontSize: height / 25),
                    ),
                  ],
                ),
              )
            else
              Text(
                firstText,
                style: firstTextStyle,
              ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleItemButton(
                  width: width * 0.13,
                  height: width * 0.14,
                  onTap: () {},
                  child: Padding(
                    padding: EdgeInsets.all(0),
                    child: Icon(
                      Icons.add,
                      opticalSize: 3,
                      color: AppColors.third,
                      size: height / 25,
                    ),
                  ),
                ),
                SizedBox(
                  width: width / 55,
                ),
                CircleItemButton(
                  width: width * 0.13,
                  height: width * 0.14,
                  onTap: () {
                    if (goToSetting != null) {
                      goToSetting!();
                    } else {
                      Get.toNamed(Screens.settings);
                    }
                  },
                  child: Padding(
                    padding: EdgeInsets.all(0),
                    child: SvgPicture.asset(
                      AppIcons.settings,
                      color: AppColors.black,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
