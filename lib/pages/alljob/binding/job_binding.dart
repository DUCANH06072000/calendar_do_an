import 'package:calendar_do_an/pages/alljob/controller/job_controller.dart';
import 'package:get/get.dart';
class JobBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => JobController());
  }

}