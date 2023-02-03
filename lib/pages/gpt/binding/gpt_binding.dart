import 'package:calendar_do_an/pages/gpt/controller/gpt_controller.dart';
import 'package:get/get.dart';
class GptBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => GptController());
  }

}