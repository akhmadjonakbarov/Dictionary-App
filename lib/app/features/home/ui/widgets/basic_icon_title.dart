import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BasicIconTitle extends StatelessWidget {
  const BasicIconTitle({
    super.key,
    required this.height,
    required this.width,
    required this.first,
    this.second,
    required this.iconPath,
    this.firstTextStyle,
    this.secondTextStyle,
    this.padding,
  });

  final double height;
  final double width;
  final String iconPath;
  final String first;
  final String? second;
  final TextStyle? firstTextStyle;
  final TextStyle? secondTextStyle;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding ??
          EdgeInsets.symmetric(
            horizontal: width / 85,
          ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (second != null)
            RichText(
              text: TextSpan(
                style: firstTextStyle,
                children: [
                  TextSpan(
                    text: first,
                  ),
                  TextSpan(
                    text: '\n',
                  ),
                  TextSpan(text: second, style: secondTextStyle)
                ],
              ),
            )
          else
            Text(
              first,
              style: firstTextStyle,
            ),
          SvgPicture.asset(
            iconPath,
          ),
        ],
      ),
    );
  }
}
