import 'package:dictionary_app/app/features/grammar/grammar_screen.dart';
import 'package:dictionary_app/app/features/practice/ui/practice_detail.dart';
import 'package:dictionary_app/app/features/start/ui/start_screen.dart';
import 'package:dictionary_app/app/features/vocabulary/vocabulary_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'core/screens.dart';
import 'features/about/about_screen.dart';

import 'features/home/ui/home_screen.dart';
import 'features/practice/ui/practice_screen.dart';
import 'features/settings/ui/setting_screen.dart';
import 'features/home/logic/home_bindings.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Diary App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: Screens.start,
      getPages: [
        GetPage(
          name: Screens.start,
          page: () => StartScreen(),
        ),
        GetPage(
          name: Screens.home,
          page: () => HomeScreen(),
          binding: HomeBindings(),
        ),
        GetPage(
          name: Screens.grammar,
          page: () => GrammarScreen(),
        ),
        GetPage(
          name: Screens.practiceDetail,
          page: () => PracticeDetail(),
        ),
        GetPage(
          name: Screens.vocabulary,
          page: () => VocabularyScreen(),
        ),
        GetPage(
          name: Screens.settings,
          page: () => SettingsScreen(),
        ),
        GetPage(
          name: Screens.about,
          page: () => AboutScreen(),
        ),
        GetPage(
          name: Screens.practice,
          page: () => PracticeScreen(),
        ),
      ],
    );
  }
}
