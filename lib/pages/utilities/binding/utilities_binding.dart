import 'package:calendar_do_an/pages/utilities/controller/utilities_controller.dart';
import 'package:get/get.dart';
class UtilitiesBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => UtilitiesController());
  }

}