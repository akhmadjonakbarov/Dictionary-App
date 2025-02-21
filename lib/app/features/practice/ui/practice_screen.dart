import 'package:dictionary_app/app/ui/app_icons.dart';
import 'package:dictionary_app/app/utils/radius_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../shared/widgets/custom_scaffold.dart';
import '../../../shared/widgets/headers.dart';
import '../../../shared/widgets/responsive_widget.dart';
import '../../../ui/app_colors.dart';

import 'widgets/practice_card.dart';
import 'widgets/progress_level.dart';
import 'widgets/progress_way.dart';

class PracticeScreen extends StatelessWidget {
  PracticeScreen({super.key});

  final List<String> levels = [
    'Level 1',
    'Level 2',
    'Level 3',
    'Level 4',
  ];

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      backgroundColor: AppColors.primary,
      padding: EdgeInsets.zero,
      body: ResponsiveWidget(
        builder: (ctx, width, height) {
          final radius = Radius.circular(height / 50);

          return ListView(
            children: [
              Header(
                radius: radius,
                firstText: "Practice",
                firstTextStyle: GoogleFonts.quicksand(
                  color: AppColors.black,
                  fontSize: height / 30,
                  fontWeight: FontWeight.w600,
                ),
                secondTextStyle: GoogleFonts.quicksand(
                  color: AppColors.black,
                ),
                secondText: "Repetition",
              ),
              SizedBox(
                height: height / 45,
              ),
              Container(
                padding: EdgeInsets.all(height / 85),
                margin: EdgeInsets.symmetric(
                  horizontal: 5,
                ),
                height: height * 0.16,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: AppColors.borderColor,
                  ),
                  color: AppColors.white,
                  borderRadius: RadiusManager.circular(
                    context: context,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Progress Tracker",
                      style: GoogleFonts.quicksand(
                        fontSize: height / 45,
                        fontWeight: FontWeight.w500,
                        color: AppColors.grey,
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(),
                      height: height / 10,
                      width: width,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          ProgressWay(
                            width: width * 0.8,
                            height: height,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              for (var level in levels)
                                ProgressLevel(
                                    width: width, height: height, level: level)
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(
                  horizontal: 5,
                  vertical: height / 55,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Practice",
                      style: GoogleFonts.quicksand(
                        fontWeight: FontWeight.w600,
                        fontSize: height / 30,
                      ),
                    ),
                    LayoutBuilder(
                      builder: (context, constraints) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            PracticeCard(
                              height: height,
                              width: width,
                              constraints: constraints,
                              onClick: () {},
                              firstLang: PracticeLabelCard(
                                lang: "Russian",
                              ),
                              secondLang: PracticeLabelCard(
                                lang: "English",
                                textColor: AppColors.third,
                              ),
                            ),
                            PracticeCard(
                              height: height,
                              width: width,
                              constraints: constraints,
                              onClick: () {},
                              firstLang: PracticeLabelCard(
                                lang: "English",
                              ),
                              secondLang: PracticeLabelCard(
                                lang: "Russian",
                                textColor: AppColors.third,
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(
                  horizontal: 5,
                ),
                padding: EdgeInsets.all(height / 50),
                height: height / 6,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: RadiusManager.circular(
                    context: context,
                  ),
                  border: Border.all(
                    color: AppColors.borderColor,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Latest result",
                      style: GoogleFonts.quicksand(
                        fontWeight: FontWeight.w500,
                        fontSize: height / 50,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(
                        vertical: height * 0.1 / 15,
                      ),
                      child: RichText(
                        text: TextSpan(
                          style: GoogleFonts.quicksand(
                            color: AppColors.grey,
                            fontSize: height / 35,
                            fontWeight: FontWeight.w500,
                          ),
                          children: [
                            TextSpan(
                              text: "25",
                              style: GoogleFonts.quicksand(
                                color: AppColors.black,
                              ),
                            ),
                            TextSpan(
                              text: " to ",
                            ),
                            TextSpan(
                              text: "40 words",
                            )
                          ],
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Stack(
                            alignment: Alignment.centerLeft,
                            children: [
                              Container(
                                width: width,
                                height: height * 0.1 / 5,
                                decoration: BoxDecoration(
                                  borderRadius: RadiusManager.circular(
                                    context: context,
                                    radius: 50,
                                  ),
                                  color: AppColors.whiteSmoke,
                                ),
                              ),
                              Container(
                                width: width * 0.65,
                                height: height * 0.1 / 5,
                                decoration: BoxDecoration(
                                  borderRadius: RadiusManager.circular(
                                    context: context,
                                    radius: 50,
                                  ),
                                  color: AppColors.third,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: width * 0.1 / 3,
                        ),
                        Text(
                          '85%',
                          style: GoogleFonts.quicksand(
                            fontWeight: FontWeight.w500,
                            fontSize: height / 50,
                          ),
                        )
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
