import 'package:dictionary_app/app/ui/app_icons.dart';

import 'package:flutter/material.dart';

import '../../../shared/widgets/custom_scaffold.dart';
import '../../../shared/widgets/headers.dart';
import '../../../shared/widgets/responsive_widget.dart';
import '../../../ui/app_colors.dart';
import 'widgets/basic_icon_title.dart';
import 'widgets/card_with_text.dart';

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
                        constraints: constraints,
                        height: height,
                        first: "Practice",
                        second: "Repetition",
                      ),
                      CardWithText(
                        constraints: constraints,
                        height: height,
                        first: "Grammar",
                        second: "Rules",
                      ),
                    ],
                  );
                },
              ),
              Container(
                margin: EdgeInsets.symmetric(
                  horizontal: width * 0.1 / 4,
                  vertical: height / 90,
                ),
                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 8),
                height: height / 5,
                decoration: BoxDecoration(
                  color: AppColors.third,
                  borderRadius: BorderRadius.circular(
                    height / 90,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: width / 85,
                      ),
                      child: BasicIconTitle(
                        height: height,
                        first: 'First',
                        second: '',
                        iconPath: AppIcons.zoom,
                      ),
                    ),
                    SizedBox(
                      height: height / 8,
                      child: ListView.separated(
                        separatorBuilder: (context, index) =>
                            SizedBox(width: width * 0.1 / 3),
                        scrollDirection: Axis.horizontal,
                        itemCount: 15,
                        itemBuilder: (context, index) {
                          return ClipRRect(
                            borderRadius: BorderRadius.circular(height / 95),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.amber,
                                borderRadius:
                                    BorderRadius.circular(height / 95),
                              ),
                              width: width * 0.22,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Car |ka:r|",
                                  ),
                                  Container(
                                    height: height / 10,
                                    decoration: BoxDecoration(
                                      color: Colors.red,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(
                  horizontal: width * 0.1 / 4,
                  vertical: height / 90,
                ),
                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 8),
                height: height / 5,
                decoration: BoxDecoration(
                  color: AppColors.third,
                  borderRadius: BorderRadius.circular(
                    height / 90,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: width / 85,
                      ),
                      child: BasicIconTitle(
                        height: height,
                        first: 'First',
                        second: '',
                        iconPath: AppIcons.zoom,
                      ),
                    ),
                    SizedBox(
                      height: height / 8,
                      child: ListView.separated(
                        separatorBuilder: (context, index) =>
                            SizedBox(width: width * 0.1 / 3),
                        scrollDirection: Axis.horizontal,
                        itemCount: 15,
                        itemBuilder: (context, index) {
                          return ClipRRect(
                            borderRadius: BorderRadius.circular(height / 95),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.amber,
                                borderRadius:
                                    BorderRadius.circular(height / 95),
                              ),
                              width: width * 0.22,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Car |ka:r|",
                                  ),
                                  Container(
                                    height: height / 10,
                                    decoration: BoxDecoration(
                                      color: Colors.red,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(
                  horizontal: width * 0.1 / 4,
                  vertical: height / 90,
                ),
                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 8),
                height: height / 5,
                decoration: BoxDecoration(
                  color: AppColors.third,
                  borderRadius: BorderRadius.circular(
                    height / 90,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: width / 85,
                      ),
                      child: BasicIconTitle(
                        height: height,
                        first: 'First',
                        second: '',
                        iconPath: AppIcons.zoom,
                      ),
                    ),
                    SizedBox(
                      height: height / 8,
                      child: ListView.separated(
                        separatorBuilder: (context, index) =>
                            SizedBox(width: width * 0.1 / 3),
                        scrollDirection: Axis.horizontal,
                        itemCount: 15,
                        itemBuilder: (context, index) {
                          return ClipRRect(
                            borderRadius: BorderRadius.circular(height / 95),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.amber,
                                borderRadius:
                                    BorderRadius.circular(height / 95),
                              ),
                              width: width * 0.22,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Car |ka:r|",
                                  ),
                                  Container(
                                    height: height / 10,
                                    decoration: BoxDecoration(
                                      color: Colors.red,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    )
                  ],
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
