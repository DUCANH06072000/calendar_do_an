import 'package:calendar_do_an/pages/base/view/base_screen.dart';
import 'package:calendar_do_an/pages/home/home/home_controller.dart';
import 'package:calendar_do_an/pages/home/view/appbar_home_child.dart';
import 'package:calendar_do_an/pages/home/view/calendar_child.dart';
import 'package:calendar_do_an/pages/home/view/events_child.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../widget/infor_widget.dart';
class HomeScreen extends BaseScreen<HomeController>{
  @override
  Widget getView() {
      return Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            appBar(),
            calendar(),
            Container(
                padding: EdgeInsets.only(left: 16.w),
                child: TextWidget(label: 'Nội dung sự kiện',fontWeight: FontWeight.w600,)),
            events(),
          ],
        ),
      );
  }

  @override
  bool isIconBrightnessLight() {
    return false;
  }


}