import 'package:calendar_do_an/pages/home/view/home_screen.dart';
import 'package:calendar_do_an/resources/style/color.dart';
import 'package:calendar_do_an/untils/log/log_util.dart';
import 'package:calendar_do_an/widget/appbar_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension AppBarScreen on HomeScreen {
  Widget appBar() {
    return AppBarWidget(
      content: 'Chọn các nội dung khác trên Menu',
      title: 'Thời khóa biểu',
      onPressed: () {
        var time = DateTime(controller.year, controller.month + 1, 0);
        var dayFirstMonth = DateTime(controller.year, controller.month, 1).weekday;
        controller.getDayInMonth(time,dayFirstMonth);
      },
    );
  }
}
