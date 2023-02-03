import 'package:calendar_do_an/pages/gpt/controller/gpt_controller.dart';
import 'package:calendar_do_an/pages/home/home/home_controller.dart';
import 'package:calendar_do_an/pages/main/controller/main_controller.dart';
import 'package:calendar_do_an/pages/utilities/binding/utilities_binding.dart';
import 'package:calendar_do_an/pages/utilities/controller/utilities_controller.dart';
import 'package:calendar_do_an/pages/utilities/view/utilities_screen.dart';
import 'package:get/get.dart';
class MainBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => MainController());
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => UtilitiesController());
    Get.lazyPut(() => GptController());
  }

}