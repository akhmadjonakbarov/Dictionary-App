import 'package:dictionary_app/app/shared/logics/word_controller.dart';
import 'package:dictionary_app/app/shared/widgets/custom_scaffold.dart';
import 'package:dictionary_app/app/shared/widgets/headers.dart';
import 'package:dictionary_app/app/shared/widgets/responsive_widget.dart';
import 'package:dictionary_app/app/ui/text_styles.dart';
import 'package:dictionary_app/app/utils/radius_manager.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/data/constants_data.dart';
import '../../shared/models/word.dart';
import '../../ui/app_colors.dart';
import '../start/ui/widgets/level_item.dart';

class VocabularyScreen extends StatefulWidget {
  const VocabularyScreen({super.key});

  @override
  State<VocabularyScreen> createState() => _VocabularyScreenState();
}

class _VocabularyScreenState extends State<VocabularyScreen> {
  String? selectedLevel;

  final WordController wordController = Get.find<WordController>();

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      padding: EdgeInsets.zero,
      backgroundColor: AppColors.primary,
      body: ResponsiveWidget(
        builder: (ctx, width, height) {
          final radius = Radius.circular(height / 50);
          return ListView(
            children: [
              Header(
                radius: radius,
                firstText: "Vocabulary",
                firstTextStyle: QuickSandTextStyle.weightW500(
                  color: AppColors.black,
                  size: height / 35,
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 5, vertical: height / 85),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Skill Level",
                      style: GoogleFonts.inter(
                        fontSize: height / 45,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: height / 50),
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(height * 0.1 / 8),
                      height: height / 15,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          height,
                        ),
                        color: AppColors.white,
                        border: Border.all(
                          color: AppColors.borderColor,
                        ),
                      ),
                      child: LayoutBuilder(
                        builder: (context, constraints) {
                          return ListView.separated(
                            separatorBuilder: (context, index) => SizedBox(
                              width: constraints.maxWidth * 0.1 / 2,
                            ),
                            scrollDirection: Axis.horizontal,
                            itemCount: levels.length,
                            itemBuilder: (context, index) {
                              return LevelItem(
                                level: levels[index],
                                height: height,
                                constraints: constraints,
                                isSelected: levels[index] == selectedLevel,
                                onClick: (value) {
                                  wordController.filterWord(selectedLevel!);
                                  setState(() {
                                    selectedLevel = value;
                                  });
                                },
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              GridView.builder(
                padding: EdgeInsets.symmetric(horizontal: 5),
                shrinkWrap: true,
                itemCount: wordController.words.length,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: width / 25,
                  mainAxisSpacing: height / 85,
                ),
                itemBuilder: (context, index) {
                  Word word = wordController.words[index];
                  return Container(
                    padding: EdgeInsets.all(height / 90),
                    decoration: BoxDecoration(
                        color: AppColors.white,
                        border: Border.all(
                          color: AppColors.borderColor,
                        ),
                        borderRadius: RadiusManager.circular(context: context)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  word.value.capitalizeFirst!,
                                  style: QuickSandTextStyle.weightW600(
                                      size: height / 52),
                                ),
                                PopupMenuButton<String>(
                                  padding: EdgeInsets.zero,
                                  onSelected: (String result) {},
                                  itemBuilder: (BuildContext context) =>
                                      <PopupMenuEntry<String>>[
                                    PopupMenuItem<String>(
                                      value: 'Edit',
                                      child: PopupMenuItems(
                                        icon: Icons.edit,
                                        text: "Edit",
                                      ),
                                    ),
                                    PopupMenuItem<String>(
                                      value: 'Delete',
                                      child: PopupMenuItems(
                                        icon: Icons.delete_outline,
                                        text: "Delete",
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '(${word.key})',
                                  style: QuickSandTextStyle.weightW500(
                                      color: AppColors.grey, size: height / 58),
                                ),
                                // Text(
                                //   '(машина)',
                                //   style: QuickSandTextStyle.weightW500(
                                //     color: AppColors.third,
                                //     size: height / 58,
                                //   ),
                                // ),
                              ],
                            ),
                          ],
                        ),
                        Container(
                          height: height / 10,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                word.image,
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                },
              )
            ],
          );
        },
      ),
    );
  }
}

class PopupMenuItems extends StatelessWidget {
  const PopupMenuItems({super.key, required this.icon, required this.text});

  final String text;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [Text(text), Icon(icon)],
    );
  }
}
