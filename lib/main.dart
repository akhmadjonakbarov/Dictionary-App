import 'package:dictionary_app/app/shared/logics/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app/app.dart';
import 'app/core/storage/shared_prefs_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPrefsHelper sharedPrefsHelper = SharedPrefsHelper();
  await sharedPrefsHelper.init();
  Get.put(sharedPrefsHelper);
  Get.put(UserController());
  runApp(const MyApp());
}
