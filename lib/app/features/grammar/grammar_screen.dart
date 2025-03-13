import 'package:dictionary_app/app/core/data/constants_data.dart';
import 'package:dictionary_app/app/shared/widgets/custom_scaffold.dart';
import 'package:dictionary_app/app/shared/widgets/responsive_widget.dart';
import 'package:dictionary_app/app/ui/text_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dictionary_app/app/ui/app_icons.dart';
import 'package:dictionary_app/app/utils/radius_manager.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../shared/widgets/headers.dart';
import '../../ui/app_colors.dart';

class GrammarScreen extends StatefulWidget {
  const GrammarScreen({super.key});

  @override
  State<GrammarScreen> createState() => _GrammarScreenState();
}

class _GrammarScreenState extends State<GrammarScreen> {
  double? sizeOfContainer;

  bool isExpanded = false;

  int? selectedIndex;

  void selectContainer(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      padding: EdgeInsets.zero,
      body: ResponsiveWidget(
        builder: (ctx, width, height) {
          final defaultHeight = height / 18;
          final radius = Radius.circular(height / 50);
          return Column(
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
                height: height / 50,
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: 5,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: RadiusManager.circular(context: context),
                    border: Border.all(
                      color: AppColors.borderColor,
                    ),
                  ),
                  child: ListView(
                    padding: EdgeInsets.symmetric(
                      horizontal: width * 0.1 / 3,
                      vertical: height * 0.1 / 10,
                    ),
                    children: [
                      Text(
                        "Grammatical rules",
                        style: QuickSandTextStyle.weightW500(
                          size: height / 55,
                          color: AppColors.textGrey,
                        ),
                      ),
                      ListView.separated(
                        padding: EdgeInsets.only(
                          top: height / 45,
                        ),
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          final rule = grammarRules[index];
                          return GestureDetector(
                            onTap: () {
                              selectContainer(index);
                              setState(() {
                                sizeOfContainer = height * 0.35;
                                isExpanded = !isExpanded;
                              });
                            },
                            child: Container(
                              padding: EdgeInsets.all(height / 95),
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(color: AppColors.borderColor),
                                  borderRadius: RadiusManager.circular(
                                    context: context,
                                    radius: 10,
                                  )),
                              height: selectedIndex == index && isExpanded
                                  ? sizeOfContainer
                                  : defaultHeight,
                              child: Column(
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        rule['name'],
                                        style: QuickSandTextStyle.weightW600(
                                          size: height / 45,
                                        ),
                                      ),
                                      SvgPicture.asset(
                                        selectedIndex == index && isExpanded
                                            ? AppIcons.au
                                            : AppIcons.ad,
                                      )
                                    ],
                                  ),
                                  Expanded(
                                      child: ListView(
                                    children: List.generate(
                                      rule['desc'].length,
                                      (index) {
                                        return Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Icon(
                                              CupertinoIcons.circle_fill,
                                              size: height / 95,
                                            ),
                                            SizedBox(
                                              width: width * 0.1 / 3,
                                            ),
                                            Expanded(
                                              child: Text(
                                                rule['desc'][index],
                                                style: QuickSandTextStyle
                                                    .weightW500(
                                                  size: height / 55,
                                                ),
                                              ),
                                            )
                                          ],
                                        );
                                      },
                                    ),
                                  ))
                                ],
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return SizedBox(
                            height: height / 75,
                          );
                        },
                        itemCount: grammarRules.length,
                      )
                    ],
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
