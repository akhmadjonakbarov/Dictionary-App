import 'dart:developer';

import 'package:dictionary_app/app/core/screens.dart';
import 'package:dictionary_app/app/shared/models/user.dart';
import 'package:dictionary_app/app/ui/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/storage/shared_prefs_helper.dart';

class UserController extends GetxController {
  var user = User.empty().obs;
  final SharedPrefsHelper sharedPrefsHelper = Get.find<SharedPrefsHelper>();

  void auth() {
    try {
      String? userJson = sharedPrefsHelper.getString('user');

      if (userJson != null) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          Get.offAndToNamed(Screens.home);
        });
        User _user = User.fromJson(userJson);
        user(_user);
      }
      log("User: $userJson");
    } catch (e) {
      handleError(e.toString());
    }
  }

  void getUser() {
    String? userJson = sharedPrefsHelper.getString('user');
    if (userJson != null) {
      User _userFromJson = User.fromJson(userJson);
      user(_userFromJson);
    }
    log("User: ${user.value}");
  }

  void login(String learningLang, String level) {
    try {
      if (level.isEmpty) {
        Get.snackbar("Warning!", "Please choose a level");
      }
      if (learningLang.isEmpty) {
        Get.snackbar("Warning!", "Please choose a learning language");
      }
      final user = User(
        learningLang: learningLang,
        level: level,
        lvl: 1,
      );
      sharedPrefsHelper.setString('user', user.toJson());
      Get.snackbar(
        "Success",
        "User was created successfully",
        colorText: AppColors.white,
        backgroundColor: Colors.green,
      );
      Get.toNamed(Screens.home);
    } catch (e) {
      handleError(e.toString());
    }
  }

  void updateUser(String name, String level) async {
    try {
      getUser();
      if (level.isEmpty) {
        Get.snackbar("Warning!", "Please choose a level");
      }
      final newUser = User(
        name: name,
        level: level,
        lvl: user.value.lvl,
        learningLang: user.value.learningLang,
      );
      sharedPrefsHelper.setString('user', newUser.toJson());
      Get.snackbar(
        "Success",
        "User was updated successfully",
        backgroundColor: Colors.green,
        colorText: AppColors.white,
      );
    } catch (e) {
      handleError(e.toString());
    }
  }

  void updateUserLevel() {
    try {
      getUser();
      if (user.value.lvl == 4) {
        Get.snackbar("Warning!", "You have reached the maximum level");
        return;
      }
      final newUser = User(
        name: user.value.name,
        level: user.value.level,
        lvl: user.value.lvl + 1,
        learningLang: user.value.learningLang,
      );
      sharedPrefsHelper.setString('user', newUser.toJson());
      Get.snackbar(
        "Success",
        "User's level was updated successfully",
        backgroundColor: Colors.green,
        colorText: AppColors.white,
      );
    } catch (e) {
      handleError(e.toString());
    }
  }

  handleError(String e) {
    log("Error: $e");
    Get.snackbar(
      "Error!",
      e,
      backgroundColor: Colors.red,
    );
  }
}
