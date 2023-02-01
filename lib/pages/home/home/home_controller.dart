import 'dart:async';

import 'package:calendar_do_an/pages/base/controller/base_controller.dart';
import 'package:calendar_do_an/untils/log/log_util.dart';

class HomeController extends BaseController {
  List<int> calendarBloc = [];
  int month = DateTime.now().month;
  int year = DateTime.now().year;

  /// lấy ngày trong tháng
  void getDayInMonth(DateTime time, int dayFirst) {
    for (int i = 0; i < time.day + (dayFirst-1)+20; i++) {
      if (calendarBloc.length < time.day + (dayFirst-1)+20) {
        if (i < dayFirst - 1) {
          calendarBloc.add(0);
        } else if (i >= time.day + (dayFirst - 1)) {
          calendarBloc.add(0);
        } else {
          calendarBloc.add((i + 1) - (dayFirst - 1));
        }
      }
    }
    refreshScreen();
  }
  /// ẩn ngày
  bool hideDay(int index){
    if(calendarBloc[index]==0){
      return false;
    }
    return true;
  }

  @override
  Future<void> onInitData() async {
    var time = DateTime(year, month + 1, 0);
    var dayFirstMonth = DateTime(year, month, 1).weekday;
    Log().e(dayFirstMonth.toString());
    getDayInMonth(time,dayFirstMonth);
  }
}
