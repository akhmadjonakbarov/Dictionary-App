import 'package:dictionary_app/app/features/home/ui/widgets/circle_item_button.dart';
import 'package:dictionary_app/app/shared/logics/user_controller.dart';
import 'package:dictionary_app/app/shared/widgets/buttons.dart';
import 'package:dictionary_app/app/ui/text_styles.dart';
import 'package:dictionary_app/app/utils/radius_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../ui/app_colors.dart';

import '../../../shared/widgets/custom_scaffold.dart';
import '../../../shared/widgets/responsive_widget.dart';

import '../../start/ui/widgets/level_item.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final List<String> levels = [
    'beginner',
    'intermediate',
    'advanced',
  ];

  String? selectedLevel;

  final TextEditingController _textEditingController = TextEditingController();
  final UserController userController = Get.find<UserController>();

  @override
  void initState() {
    userController.getUser();
    selectedLevel = userController.user.value.level;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      backgroundColor: AppColors.primary,
      padding: EdgeInsets.zero,
      body: ResponsiveWidget(
        builder: (ctx, width, height) => Padding(
          padding: EdgeInsets.symmetric(
            horizontal: width * 0.1 / 3,
          ),
          child: Obx(
            () {
              _textEditingController.text =
                  userController.user.value.name ?? "";

              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          CircleItemButton(
                            height: height / 10,
                            width: width / 8,
                            child: Icon(Icons.arrow_back),
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                          ),
                          SizedBox(
                            width: width / 50,
                          ),
                          Text(
                            "Settings",
                            style: GoogleFonts.quicksand(
                              fontSize: height / 40,
                              fontWeight: FontWeight.w600,
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: height * 0.1 / 10,
                      ),
                      Text(
                        "Name",
                        style: GoogleFonts.quicksand(
                          fontSize: height / 40,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      TextField(
                        controller: _textEditingController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: RadiusManager.circular(
                              context: context,
                              radius: 45,
                            ),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: width * 0.1 / 2,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: height / 45,
                      ),
                      Column(
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
                                  separatorBuilder: (context, index) =>
                                      SizedBox(
                                    width: constraints.maxWidth * 0.1 / 2,
                                  ),
                                  scrollDirection: Axis.horizontal,
                                  itemCount: levels.length,
                                  itemBuilder: (context, index) {
                                    return LevelItem(
                                      level: levels[index],
                                      height: height,
                                      constraints: constraints,
                                      isSelected:
                                          levels[index] == selectedLevel,
                                      onClick: (value) {
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
                    ],
                  ),
                  BasicButton(
                    height: height / 16,
                    onTap: () {
                      if (_textEditingController.text.isNotEmpty) {
                        userController.updateUser(
                          _textEditingController.text,
                          selectedLevel!,
                        );
                      } else {
                        Get.snackbar(
                          "Warning!",
                          "",
                          messageText: Text(
                            "Please enter your name",
                            style: QuickSandTextStyle.weightW500(
                                color: AppColors.white, size: height / 60),
                          ),
                          backgroundColor: Colors.orange,
                          colorText: AppColors.white,
                        );
                      }
                    },
                    borderRadius:
                        RadiusManager.circular(context: context, radius: 45),
                    child: Text(
                      "Save",
                      style: GoogleFonts.quicksand(
                        fontSize: height / 45,
                        color: AppColors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
