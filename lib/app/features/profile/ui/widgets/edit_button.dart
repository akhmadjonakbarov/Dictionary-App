import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../shared/widgets/responsive_widget.dart';
import '../../../../ui/app_colors.dart';
import '../../../../ui/app_icons.dart';

class EditButton extends StatelessWidget {
  const EditButton({super.key, required this.onTap});
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      builder: (ctx, width, height) => GestureDetector(
        onTap: onTap,
        child: Container(
          margin: EdgeInsets.all(height * 0.1 / 15),
          width: 25,
          height: 25,
          padding: EdgeInsets.all(height * 0.1 / 13),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.secondary,
          ),
          child: SvgPicture.asset(
            AppIcons.edit,
          ),
        ),
      ),
    );
  }
}
