import 'package:flutter/material.dart';
import 'dart:developer' as dev;
import '../../shared/widgets/custom_scaffold.dart';
import '../../shared/widgets/headers.dart';
import '../../shared/widgets/responsive_widget.dart';
import '../../ui/app_colors.dart';
import '../../ui/app_icons.dart';

import '../start/ui/widgets/section_button.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  Future<void> _launchUrl({String url = 'https://www.google.com/'}) async {
    Uri uri = Uri.parse(url);
    dev.log(uri.toString());
  }

  Future<void> sendMail(String mail) async {
    final Uri uri = Uri(
      scheme: 'mailto',
      path: mail,
      queryParameters: {
        'subject': 'Greetings',
        'body': Uri.encodeComponent('Hello World'),
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      padding: EdgeInsets.zero,
      backgroundColor: AppColors.primary,
      body: ResponsiveWidget(
        builder: (ctx, width, height) => Padding(
          padding: EdgeInsets.symmetric(
            vertical: height / 15,
            horizontal: width / 15,
          ),
          child: Column(
            children: [
              TopBar(title: "About Us"),
              SizedBox(
                height: height / 25,
              ),
              Container(
                height: height * 0.25,
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: height * 0.1 / 50),
                decoration: BoxDecoration(
                  color: AppColors.secondary,
                  borderRadius: BorderRadius.circular(5),
                ),
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SectionButton(
                      iconPath: AppIcons.contactUs,
                      onClick: () {
                        sendMail("test@example.com");
                      },
                      text: "Contact Us",
                    ),
                    Divider(
                      color: AppColors.dividerColor,
                    ),
                    SectionButton(
                      iconPath: AppIcons.privacyPolicy,
                      onClick: () {
                        _launchUrl();
                      },
                      text: "Privacy Policy",
                    ),
                    Divider(
                      color: AppColors.dividerColor,
                    ),
                    SectionButton(
                      iconPath: AppIcons.privacyPolicy,
                      onClick: () {
                        _launchUrl();
                      },
                      text: "Terms of Use",
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
