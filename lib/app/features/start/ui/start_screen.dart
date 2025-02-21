import 'package:country_flags/country_flags.dart';
import 'package:dictionary_app/app/core/data/constants_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../shared/widgets/buttons.dart';

import '../../../shared/widgets/custom_scaffold.dart';
import '../../../shared/widgets/responsive_widget.dart';
import '../../../ui/app_colors.dart';
import 'widgets/greeting.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  final List<String> levels = [
    'beginner',
    'intermediate',
    'advanced',
  ];
  String? selectedValue;

  var items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];

  String? selectedLevel;

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      backgroundColor: AppColors.primary,
      padding: EdgeInsets.zero,
      body: ResponsiveWidget(
        builder: (ctx, width, height) {
          return Stack(
            children: [
              Greeting(
                height: height,
              ),
              Positioned(
                bottom: 0,
                child: Container(
                  padding: EdgeInsets.all(
                    height / 65,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(height / 25),
                      topRight: Radius.circular(height / 25),
                    ),
                    color: AppColors.secondary,
                    border: Border.all(
                      color: AppColors.borderColor,
                    ),
                  ),
                  height: height * 0.57,
                  width: width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        textAlign: TextAlign.start,
                        text: TextSpan(
                          text: "Hello!",
                          style: GoogleFonts.inter(
                            color: AppColors.third,
                            fontSize: height / 40,
                            fontWeight: FontWeight.w400,
                          ),
                          children: [
                            TextSpan(
                              text: "\n",
                            ),
                            WidgetSpan(
                              child: SizedBox(
                                height: height / 30,
                              ),
                            ),
                            TextSpan(
                              text:
                                  "Learn words, grammar, and translations across many languages. Your global language journey starts here!",
                              style: GoogleFonts.inter(
                                color: AppColors.grey,
                                fontSize: height / 49,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
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
                          Text(
                            "Language selection for learning:",
                            style: GoogleFonts.quicksand(
                              fontSize: height / 45,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Container(
                            width: width,
                            margin: EdgeInsets.symmetric(vertical: height / 50),
                            padding: EdgeInsets.symmetric(
                              horizontal: width * 0.1 / 2,
                            ),
                            alignment: Alignment.centerLeft,
                            height: height / 16,
                            child: DropdownButton(
                              isExpanded: true,
                              style: GoogleFonts.quicksand(
                                color: Colors.green,
                                fontSize: height / 50,
                                fontWeight: FontWeight.w500,
                              ),
                              value: selectedValue,
                              hint: Text("Languages"),
                              selectedItemBuilder: (BuildContext context) {
                                return countryLanguageMap.entries.map(
                                  (entry) {
                                    return Row(
                                      children: [
                                        CountryFlag.fromCountryCode(
                                          entry.key,
                                          height: height / 25,
                                          shape: const RoundedRectangle(6),
                                        ),
                                        SizedBox(
                                          width: width * 0.1 / 3,
                                        ),
                                        Text(entry.value),
                                      ],
                                    );
                                  },
                                ).toList();
                              },
                              // Down Arrow Icon
                              icon: const Icon(Icons.keyboard_arrow_down),

                              // Array list of items
                              items: countryLanguageMap.entries.map(
                                (entry) {
                                  return DropdownMenuItem(
                                    value: entry.key,
                                    // Use the country code as the value
                                    child: Row(
                                      children: [
                                        CountryFlag.fromCountryCode(
                                          entry.key,
                                          height: height / 25,
                                          shape: const RoundedRectangle(6),
                                        ),
                                        SizedBox(
                                          width: width * 0.1 / 3,
                                        ),
                                        Text(entry.value),
                                      ],
                                    ), // Display both language and country code
                                  );
                                },
                              ).toList(),
                              // After selecting the desired option,it will
                              // change button value to selected value
                              onChanged: (newValue) {
                                setState(() {
                                  selectedValue = newValue;
                                });
                              },
                            ),
                          )
                        ],
                      ),
                      BasicButton(
                        height: height / 15,
                        borderRadius: BorderRadius.circular(height),
                        onTap: () {},
                        child: Text(
                          "Start studying",
                          style: GoogleFonts.quicksand(
                            fontSize: height / 45,
                            color: AppColors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
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

class LevelItem extends StatelessWidget {
  const LevelItem({
    super.key,
    required this.level,
    required this.constraints,
    required this.height,
    required this.isSelected,
    required this.onClick,
  });

  final String level;
  final BoxConstraints constraints;
  final double height;
  final Function(String value) onClick;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: constraints.maxWidth * 0.3,
      child: Material(
        child: Ink(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              height,
            ),
            border: Border.all(
              color: AppColors.borderColor,
            ),

          ),
          child: InkWell(
            borderRadius: BorderRadius.circular(height),
            onTap: () {
              onClick(level);
            },
            child: Center(
              child: Text(
                level.capitalizeFirst!,
                style: GoogleFonts.quicksand(
                  color: isSelected ? AppColors.third : AppColors.grey,
                  fontSize: height / 62,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
