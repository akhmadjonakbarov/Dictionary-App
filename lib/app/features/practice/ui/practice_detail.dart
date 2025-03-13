import 'package:dictionary_app/app/shared/widgets/buttons.dart';
import 'package:dictionary_app/app/ui/app_icons.dart';
import 'package:dictionary_app/app/utils/radius_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../shared/widgets/custom_scaffold.dart';
import '../../../shared/widgets/responsive_widget.dart';
import '../../../ui/app_colors.dart';
import '../../../ui/text_styles.dart';
import '../../home/ui/widgets/circle_item_button.dart';

class PracticeDetail extends StatelessWidget {
  const PracticeDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      padding: EdgeInsets.zero,
      body: ResponsiveWidget(
        builder: (ctx, width, height) {
          return Stack(
            children: [
              Positioned(
                bottom: 0,
                child: SvgPicture.asset(AppIcons.opacityBrain2),
              ),
              Padding(
                padding: EdgeInsets.all(height / 75),
                child: Column(
                  children: [
                    Row(
                      children: [
                        CircleItemButton(
                          height: height / 10,
                          width: width / 8,
                          child: Icon(Icons.arrow_back),
                          onTap: () {},
                        ),
                        SizedBox(
                          width: width / 50,
                        ),
                        Text(
                          "Practice",
                          style: GoogleFonts.quicksand(
                            fontSize: height / 40,
                            fontWeight: FontWeight.w600,
                          ),
                        )
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.all(
                        height / 75,
                      ),
                      height: height / 3,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        border: Border.all(color: AppColors.borderColor),
                        borderRadius: RadiusManager.circular(
                          context: context,
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Text(
                                '(машина)',
                                style: QuickSandTextStyle.weightW500(
                                    color: AppColors.grey, size: height / 58),
                              ),
                              Text(
                                '(машина)',
                                style: QuickSandTextStyle.weightW500(
                                  color: AppColors.third,
                                  size: height / 58,
                                ),
                              ),
                            ],
                          ),
                          Container(
                            height: height / 4.5,
                            decoration: BoxDecoration(
                              color: Colors.yellow,
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: height / 25,
                    ),
                    GridView.count(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      crossAxisCount: 2,
                      // 2 columns
                      mainAxisSpacing: 16,
                      childAspectRatio: 4,
                      crossAxisSpacing: 16,
                      children: List.generate(
                        4,
                        (index) {
                          return BasicButton(
                            border: Border.all(color: AppColors.borderColor),
                            color: AppColors.white,
                            height: height,
                            width: width * 0.1,
                            onTap: () {},
                            child: Text('Button ${index + 1}'),
                          );
                        },
                      ),
                    ),
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
