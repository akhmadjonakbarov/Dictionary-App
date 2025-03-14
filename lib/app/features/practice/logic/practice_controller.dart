import 'package:dictionary_app/app/shared/logics/user_controller.dart';
import 'package:dictionary_app/app/shared/logics/word_controller.dart';
import 'package:get/get.dart';

import '../../../core/storage/sql_database_manager.dart';
import '../../../shared/models/word.dart';

class PracticeController extends GetxController {
  var words = <Word>[].obs;
  var totalWords = 0.obs;
  var percent = 0.00.obs;

  final SQLDatabaseManager sqlDatabaseManager = Get.find<SQLDatabaseManager>();
  final UserController userController = Get.find<UserController>();
  final WordController wordController = Get.find<WordController>();

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
          if (ids[j] == lvlWords[i].id) {
            lvlWords.remove(lvlWords[i]);
          }
        }
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
}
