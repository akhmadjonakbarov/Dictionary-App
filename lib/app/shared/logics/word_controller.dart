import 'dart:math';

import 'package:dictionary_app/app/shared/models/word.dart';
import 'package:get/get.dart';
import '../../core/data/constants_data.dart' as constants_data;

class WordController extends GetxController {
  var words = <Word>[].obs;

  @override
  void onInit() {
    super.onInit();
    getWords();
  }

  void getWords() async {
    for (var i = 0; i < constants_data.words.length; i++) {
      constants_data.words[i] =
          constants_data.words[i].copyWith(level: Random().nextInt(4) + 1);
    }

    words(constants_data.words
        .where(
          (element) => element.level == 1,
        )
        .toList());
  }

  void filterWord(String lvl) {
    words(constants_data.words
        .where(
          (element) =>
              element.category.toLowerCase().contains(lvl.toLowerCase()),
        )
        .toList());
  }
}
