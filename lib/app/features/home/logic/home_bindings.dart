import 'package:dictionary_app/app/shared/logics/word_controller.dart';
import 'package:get/get.dart';

class HomeBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(WordController());
  }
}
