import 'dart:math';

import 'package:dictionary_app/app/shared/logics/user_controller.dart';
import 'package:dictionary_app/app/shared/logics/word_controller.dart';
import 'package:get/get.dart';

import '../../../core/storage/sql_database_manager.dart';
import '../../../shared/models/word.dart';

class PracticeController extends GetxController {
  var words = <Word>[].obs;
  var practiceWords = <Word>[].obs;
  var totalWords = 0.obs;
  var learntWord = 0.obs;
  var currentIndex = 0.obs;
  var selectedLang = ''.obs;

  // Flag if practice is over
  var isFinished = false.obs;
  var percent = 0.00.obs;

  // Options to show under current word (shuffled list of all values)
  var options = <String>[].obs;

  final SQLDatabaseManager sqlDatabaseManager = Get.find<SQLDatabaseManager>();
  final UserController userController = Get.find<UserController>();
  final WordController wordController = Get.find<WordController>();

  void startPractice() {
    getWords();
    currentIndex.value = 0;
    isFinished.value = false;

    // Shuffle and pick 10 words
    words.shuffle();
    practiceWords.value = words.take(10).toList();

    loadOptionsForCurrentWord();
  }

  void loadOptionsForCurrentWord() {
    // Take all word values (translations), shuffle them
    List<String> allValues = [];
    if (selectedLang.value == 'ru') {
      allValues = words.map((word) => word.value).toList();
    } else {
      allValues = words.map((word) => word.key).toList();
    }

    allValues.shuffle();
    final currentWord = practiceWords[currentIndex.value];

    final values = allValues.take(4).toList();
    values[Random().nextInt(3)] =
        selectedLang.value == 'ru' ? currentWord.value : currentWord.key;
    options.value = values;
  }

  getWords() async {
    try {
      List<Word> lvlWords = [];

      final List<Word> wordsList = await sqlDatabaseManager.getAllWords();
      wordsList.addAll(wordController.words);
      final ids = await sqlDatabaseManager.getLearnedWordIds();
      lvlWords = wordsList
          .where(
            (element) => element.level == userController.user.value.lvl,
          )
          .toList();
      totalWords.value = lvlWords.length;

      for (int i = 0; i < lvlWords.length; i++) {
        for (int j = 0; j < ids.length; j++) {
          bool isLearntWord =
              ids[j] == lvlWords[i].value || ids[j] == lvlWords[i].key;
          if (isLearntWord) {
            lvlWords.remove(lvlWords[i]);
          }
        }
      }
      if (totalWords.value == lvlWords.length) {
        userController.updateUserLevel();
      }
      words(lvlWords);

      percent.value =
          (totalWords.value - lvlWords.length) * 100 / totalWords.value;
    } catch (e) {
      Get.snackbar(
        "Error",
        e.toString(),
      );
    }
  }

  void selectAnswer(String selectedOption) {
    final currentWord = practiceWords[currentIndex.value];

    if (selectedOption == currentWord.value) {
      sqlDatabaseManager.insertLearntWord(currentWord.value);
    }

    nextWord();
  }

  void selectLang(String lang) {
    selectedLang(lang);
  }

  nextWord() async {
    if (currentIndex.value < practiceWords.length - 1) {
      currentIndex.value++;
      loadOptionsForCurrentWord();
    } else {
      isFinished.value = true;
    }
  }
}
