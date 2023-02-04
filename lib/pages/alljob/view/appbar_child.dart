import 'package:calendar_do_an/pages/alljob/view/job_screen.dart';
import 'package:calendar_do_an/widget/appbar_widget.dart';
import 'package:flutter/cupertino.dart';

import '../../../generated/assets.dart';
import 'package:get/get.dart';

extension AppBar on JobScreen {
  Widget appBar() {
    return Builder(builder: (MainScreen) {
      return AppBarWidget(
        title: 'Công việc',
        onPressed: () {
          Get.back();
        },
        image: Assets.imagesIcons8BackArrow64,
      );
    });
  }
}
