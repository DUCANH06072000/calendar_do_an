import 'package:calendar_do_an/generated/assets.dart';
import 'package:calendar_do_an/pages/jobdone/view/jobdone_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../widget/appbar_widget.dart';

extension AppBar on JobDoneScreen{

  Widget appBar() {
    return Builder(builder: (MainScreen){
      return AppBarWidget(
        title: 'Công việc đã hoàn thành',
        onPressed: () {
        }, image: Assets.imagesIcons8All58,
      );
    });
  }
}