import 'package:calendar_do_an/pages/base/controller/base_controller.dart';
import 'package:calendar_do_an/pages/gpt/view/gpt_screen.dart';
import 'package:calendar_do_an/pages/home/view/home_screen.dart';
import 'package:calendar_do_an/pages/utilities/view/utilities_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
class MainController extends BaseController {

  DateTime _lastTimeExit = DateTime.now();
  RxInt tabIndex = 0.obs;

  void onItemTapped(int position) {
    tabIndex.value = position;
  }

  Widget getPage() {
    switch (tabIndex.value) {
      case 1:
        return UtilitiesScreen();
      case 2:
        return GptScreen();
      case 3:
        return HomeScreen();
      case 0:
        return HomeScreen();
      default:
        return HomeScreen();
    }
  }

  bool onBackPressed(BuildContext context){
    if (DateTime.now().difference(_lastTimeExit) >= const Duration(seconds: 2)) {
      //showing message to user
      final snack =  SnackBar(
        content:  Text("Trở lại"),
        duration: const Duration(seconds: 2),
      );
      ScaffoldMessenger.of(context).showSnackBar(snack);
      _lastTimeExit = DateTime.now();
      return false; // disable back press
    } else {
      SystemNavigator.pop();
      return true; //  exit the app
    }
  }


  @override
  Future<void> onInitData() async {}
}
