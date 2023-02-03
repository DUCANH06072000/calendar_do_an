import 'package:calendar_do_an/generated/assets.dart';
import 'package:calendar_do_an/pages/jobdone/view/jobdone_screen.dart';
import 'package:calendar_do_an/pages/utilities/view/utilities_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../widget/appbar_widget.dart';

extension AppBar on UtilitiesScreen {
  Widget appBar() {
    return Builder(builder: (MainScreen) {
      return AppBarWidget(
        title: 'Tiện ích',
        onPressed: () {},
        image: Assets.imagesIcons8All58,
      );
    });
  }
}
