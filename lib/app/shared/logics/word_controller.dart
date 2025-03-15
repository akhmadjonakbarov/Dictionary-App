import 'dart:math';

import 'package:dictionary_app/app/core/storage/sql_database_manager.dart';
import 'package:dictionary_app/app/shared/models/word.dart';
import 'package:get/get.dart';
import '../../core/data/constants_data.dart' as constants_data;

class WordController extends GetxController {
  var words = <Word>[].obs;
  var allWords = <Word>[].obs;

  final SQLDatabaseManager sql = Get.find<SQLDatabaseManager>();

  @override
  void onInit() {
    super.onInit();
    getWords();
  }

  void getWords() async {
    List<Word> savedWords = await sql.getAllWords();

    allWords.addAll(savedWords);
    allWords.addAll(constants_data.words);

    for (var i = 0; i < allWords.length; i++) {
      if (allWords[i].level == null) {
        allWords[i] = allWords[i].copyWith(level: Random().nextInt(4) + 1);
      }
    }

    words(allWords
        .where(
          (element) => element.level == 1,
        )
        .toList());
  }

  void filterWord(String lvl) {
    getWords();
    words(allWords
        .where(
          (element) =>
              element.category.toLowerCase().contains(lvl.toLowerCase()),
        )
        .toList());
  }

  void save(Word word) async {
    await sql.insertWord(word);
    getWords();
  }
}
