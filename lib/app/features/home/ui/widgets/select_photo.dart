import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:widgets_easier/widgets_easier.dart';

import '../../../../shared/widgets/responsive_widget.dart';
import '../../../../ui/app_colors.dart';

class SelectPhoto extends StatelessWidget {
  const SelectPhoto({
    super.key,
    required this.onTap,
    required this.images,
  });

  final Function() onTap;
  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      builder: (ctx, width, height) => GestureDetector(
        onTap: onTap,
        child: Container(
          width: double.infinity,
          height: height * 0.2,
          decoration: ShapeDecoration(
            color: Colors.transparent,
            shape: DashedBorder(
              color: AppColors.dividerColor,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: images.isNotEmpty
              ? GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: height / 65,
                    mainAxisSpacing: height / 65,
                  ),
                  itemBuilder: (context, index) {
                    return Image.file(
                      File(images[index]),
                      fit: BoxFit.cover,
                    );
                  },
                  itemCount: images.length,
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 10),
                      height: height / 10,
                      width: width * 0.18,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.dividerColor,
                      ),
                      alignment: Alignment.center,
                      child: Icon(
                        Icons.camera_alt,
                        size: 35,
                        color: AppColors.background,
                      ),
                    ),
                    Text(
                      "Add photo",
                      style: GoogleFonts.montserrat(
                        color: AppColors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: height / 55,
                      ),
                    )
                  ],
                ),
        ),
      ),
    );
  }
}
