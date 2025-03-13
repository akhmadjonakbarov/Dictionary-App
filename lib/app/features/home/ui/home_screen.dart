import 'package:dictionary_app/app/core/screens.dart';
import 'package:dictionary_app/app/shared/logics/word_controller.dart';
import 'package:dictionary_app/app/ui/app_icons.dart';
import 'package:dictionary_app/app/ui/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../shared/models/word.dart';
import '../../../shared/widgets/basic_container.dart';
import '../../../shared/widgets/custom_scaffold.dart';
import '../../../shared/widgets/headers.dart';
import '../../../shared/widgets/responsive_widget.dart';
import '../../../ui/app_colors.dart';
import 'widgets/basic_icon_title.dart';
import 'widgets/card_with_text.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final WordController wordController = Get.find<WordController>();

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      padding: EdgeInsets.zero,
      backgroundColor: AppColors.primary,
      body: ResponsiveWidget(
        builder: (ctx, width, height) {
          return Obx(
            () {
              final radius = Radius.circular(height / 50);
              return ListView(
                children: [
                  Header(
                    radius: radius,
                    firstText: "Welcome to",
                    secondText: "Best Stud1x",
                  ),
                  LayoutBuilder(
                    builder: (context, constraints) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          CardWithText(
                            onClick: () {
                              Get.toNamed(Screens.practice);
                            },
                            bgColor: AppColors.white,
                            constraints: constraints,
                            height: height,
                            width: width,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                BasicIconTitle(
                                  width: width,
                                  height: height,
                                  first: "Practice",
                                  firstTextStyle: QuickSandTextStyle.weightW500(
                                    color: AppColors.black,
                                    size: height / 50,
                                  ),
                                  second: "Repetition",
                                  secondTextStyle:
                                      QuickSandTextStyle.weightW500(
                                    color: AppColors.third,
                                  ),
                                  iconPath: AppIcons.zoom,
                                ),
                                SvgPicture.asset(AppIcons.blueBrain)
                              ],
                            ),
                          ),
                          CardWithText(
                            onClick: () => Get.toNamed(Screens.grammar),
                            constraints: constraints,
                            height: height,
                            width: width,
                            bgColor: AppColors.third,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                BasicIconTitle(
                                  width: width,
                                  height: height,
                                  first: "Grammar",
                                  firstTextStyle: QuickSandTextStyle.weightW500(
                                    color: AppColors.white,
                                    size: height / 50,
                                  ),
                                  second: "Rules",
                                  iconPath: AppIcons.zoom,
                                ),
                                SvgPicture.asset(AppIcons.book)
                              ],
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                  BasicContainer(
                    onClick: () => Get.toNamed(
                      Screens.vocabulary,
                    ),
                    width: width,
                    height: height / 5,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        BasicIconTitle(
                          height: height,
                          width: width,
                          firstTextStyle: QuickSandTextStyle.weightW500(
                            size: height / 55,
                          ),
                          first: 'My Words',
                          iconPath: AppIcons.zoom,
                        ),
                        SizedBox(
                          height: height / 8,
                          child: wordController.words.isNotEmpty
                              ? ListView.separated(
                                  separatorBuilder: (context, index) =>
                                      SizedBox(width: width * 0.1 / 3),
                                  scrollDirection: Axis.horizontal,
                                  itemCount: 15,
                                  itemBuilder: (context, index) {
                                    Word word = wordController.words[index];
                                    return WordCard(word: word);
                                  },
                                )
                              : NoWord(),
                        )
                      ],
                    ),
                  ),
                  BasicContainer(
                    onClick: () => Get.toNamed(
                      Screens.vocabulary,
                    ),
                    height: height / 5,
                    width: width,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        BasicIconTitle(
                          height: height,
                          width: width,
                          first: 'Daily Words',
                          firstTextStyle: QuickSandTextStyle.weightW500(
                            size: height / 55,
                          ),
                          iconPath: AppIcons.zoom,
                        ),
                        SizedBox(
                          height: height / 8,
                          child: wordController.words.isNotEmpty
                              ? ListView.separated(
                                  separatorBuilder: (context, index) =>
                                      SizedBox(width: width * 0.1 / 3),
                                  scrollDirection: Axis.horizontal,
                                  itemCount: 15,
                                  itemBuilder: (context, index) {
                                    Word word = wordController.words[index];
                                    return WordCard(word: word);
                                  },
                                )
                              : NoWord(),
                        )
                      ],
                    ),
                  ),
                  BasicContainer(
                    onClick: () => Get.toNamed(
                      Screens.vocabulary,
                    ),
                    height: height / 5,
                    width: width,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        BasicIconTitle(
                          height: height,
                          width: width,
                          first: 'Often used',
                          firstTextStyle: QuickSandTextStyle.weightW500(
                            size: height / 55,
                          ),
                          iconPath: AppIcons.zoom,
                        ),
                        SizedBox(
                          height: height / 8,
                          child: wordController.words.isNotEmpty
                              ? ListView.separated(
                                  separatorBuilder: (context, index) =>
                                      SizedBox(width: width * 0.1 / 3),
                                  scrollDirection: Axis.horizontal,
                                  itemCount: 15,
                                  itemBuilder: (context, index) {
                                    Word word = wordController.words[index];
                                    return WordCard(word: word);
                                  },
                                )
                              : NoWord(),
                        )
                      ],
                    ),
                  )
                ],
              );
            },
          );
        },
      ),
    );
  }
}

class WordCard extends StatelessWidget {
  final Word word;

  const WordCard({super.key, required this.word});

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      builder: (ctx, width, height) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(height / 95),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(height / 95),
            ),
            width: width * 0.22,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    word.key,
                    style: QuickSandTextStyle.weightW500(
                      size: height / 60,
                    ),
                  ),
                ),
                Container(
                  height: height / 10,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    image: NetworkImage(
                      word.image,
                    ),
                    fit: BoxFit.cover,
                  )),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

class NoWord extends StatelessWidget {
  const NoWord({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      builder: (ctx, width, height) => Center(
        child: Text(
          "Words do not exist!",
          style: QuickSandTextStyle.weightW500(
            size: height / 50,
          ),
        ),
      ),
    );
  }
}
