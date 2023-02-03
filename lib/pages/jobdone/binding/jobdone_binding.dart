import 'package:calendar_do_an/pages/jobdone/controller/jobdone_controller.dart';
import 'package:get/get.dart';
class JobDoneBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => JobDoneController());
  }
  
}