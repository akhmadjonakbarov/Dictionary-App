import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class RadiusManager {
  static BorderRadius circular(
      {required BuildContext context, double radius = 2}) {
    double selectedRadius =
        radius != 2 ? radius : MediaQuery.sizeOf(context).height / 75;
    return BorderRadius.circular(selectedRadius);
  }
}
