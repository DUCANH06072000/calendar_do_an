import 'package:calendar_do_an/widget/bottomnavigaton.dart';
import 'package:calendar_do_an/widget/navbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/main_controller.dart';

class MainScreen extends GetView<MainController> {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => WillPopScope(
      onWillPop: () async {
        return controller.onBackPressed(context);
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: GestureDetector(
          onTap: () {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: controller.getPage(),
        ),
        bottomNavigationBar: BottomNavigation(onPageChange: (index){
          controller.tabIndex.value = index;
        }),
        drawer: NavBar(),
      ),
    ));
  }
}
