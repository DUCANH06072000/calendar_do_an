import 'package:calendar_do_an/pages/base/controller/base_controller.dart';
import 'package:calendar_do_an/pages/home/view/home_screen.dart';
import 'package:calendar_do_an/pages/utilities/view/utilities_screen.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
class MainController extends BaseController {


  RxInt tabIndex = 0.obs;

  void onItemTapped(int position) {
    tabIndex.value = position;
  }

  Widget getPage() {
    switch (tabIndex.value) {
      case 1:
        return HomeScreen();
      case 2:
        return UtilitiesScreen();
      case 3:
        return HomeScreen();
      case 0:
      default:
        return HomeScreen();
    }
  }

  @override
  Future<void> onInitData() async {}
}
