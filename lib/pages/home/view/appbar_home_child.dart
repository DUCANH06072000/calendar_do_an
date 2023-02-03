import 'package:calendar_do_an/generated/assets.dart';
import 'package:calendar_do_an/pages/home/view/home_screen.dart';
import 'package:calendar_do_an/pages/main/view/main_screen.dart';
import 'package:calendar_do_an/resources/style/color.dart';
import 'package:calendar_do_an/untils/log/log_util.dart';
import 'package:calendar_do_an/widget/appbar_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension AppBarScreen on HomeScreen {
  Widget appBar() {
    return Builder(builder: (MainScreen){
      return AppBarWidget(
        title: 'Thời khóa biểu',
        onPressed: () {
          Scaffold.of(context).openDrawer();
        }, image: Assets.imagesIconMenu,
      );
    });
  }
}
