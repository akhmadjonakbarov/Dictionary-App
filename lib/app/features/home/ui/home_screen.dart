import 'package:dictionary_app/app/ui/app_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../shared/widgets/custom_scaffold.dart';
import '../../../shared/widgets/responsive_widget.dart';
import '../../../ui/app_colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      padding: EdgeInsets.zero,
      backgroundColor: AppColors.primary,
      body: ResponsiveWidget(
        builder: (ctx, width, height) {
          final radius = Radius.circular(height / 50);
          return Column(
            children: [
              Container(
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
                    RichText(
                      text: TextSpan(
                        style: GoogleFonts.quicksand(
                          fontSize: height / 40,
                          color: AppColors.grey,
                        ),
                        children: [
                          TextSpan(
                            text: "Welcome to",
                          ),
                          TextSpan(
                            text: "\n",
                          ),
                          TextSpan(
                            text: "Best Stud1x",
                            style: GoogleFonts.quicksand(
                                fontWeight: FontWeight.w600,
                                color: AppColors.third,
                                fontSize: height / 25),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleItem(
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
                        CircleItem(
                          width: width * 0.13,
                          height: width * 0.14,
                          onTap: () {},
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
            ],
          );
        },
      ),
    );
  }
}

class CircleItem extends StatelessWidget {
  final double width;
  final double height;
  final Widget child;
  final Function() onTap;

  const CircleItem({
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
