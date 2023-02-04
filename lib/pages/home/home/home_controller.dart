import 'dart:async';

import 'package:calendar_do_an/pages/base/controller/base_controller.dart';
import 'package:calendar_do_an/untils/log/log_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeController extends BaseController {
  List<int> calendarBloc = [];
  int nowMonth = DateTime.now().month;
  int nowYear = DateTime.now().year;
  List<Widget> month = [];
  List<Widget> year = [];
  List<int> yearCalendar = [];
  FixedExtentScrollController controllerScroll = FixedExtentScrollController();
  FixedExtentScrollController controllerScrollYear =
      FixedExtentScrollController();

  /// lấy ngày trong tháng
  void createCalendar(DateTime time, int dayFirst) {
    for (int i = 0; i < time.day + (dayFirst - 1) + 20; i++) {
      if (calendarBloc.length < time.day + (dayFirst - 1) + 20) {
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
  bool hideDay(int index) {
    if (calendarBloc[index] == 0) {
      return false;
    }
    return true;
  }

  /// lấy tháng
  void getMonth(List month) {
    for (int i = 1; i <= 12; i++) {
      month.add(
        Container(
          child: Center(child: Text("Tháng" + " " + "$i")),
        ),
      );
    }
  }

  /// chọn tháng
  void chooseMonth(int index) {
    calendarBloc.clear();
    refreshScreen();
    nowMonth = index + 1;
    var time = DateTime(nowYear, nowMonth + 1, 0);
    var dayFirstMonth = DateTime(nowYear, nowMonth, 1).weekday;
    createCalendar(time, dayFirstMonth);
  }

  /// chọn năm
  void chooseYear(int index) {
    calendarBloc.clear();
    refreshScreen();
    nowYear = yearCalendar[index];
    var time = DateTime(nowYear, nowMonth + 1, 0);
    var dayFirstMonth = DateTime(nowYear, nowMonth, 1).weekday;
    createCalendar(time, dayFirstMonth);
  }

  Color colorsBox(int index) {
    if (nowMonth == DateTime.now().month &&
        nowYear == DateTime.now().year &&
        calendarBloc[index] == DateTime.now().day) {
      return Colors.green;
    }
    return Colors.white;
  }

  Color colorText(int index) {
    if (nowMonth == DateTime.now().month &&
        nowYear == DateTime.now().year &&
        calendarBloc[index] == DateTime.now().day) {
      return Colors.white;
    }
    return Colors.black;
  }

  /// lấy năm
  void getYear(List year) {
    for (int i = DateTime.now().year - 1; i <= DateTime.now().year + 2; i++) {
      yearCalendar.add(i);
      year.add(
        Container(child: Center(child: Container(child: Text("$i")))),
      );
    }
  }

  @override
  Future<void> onInitData() async {
    var time = DateTime(nowYear, nowMonth + 1, 0);
    var dayFirstMonth = DateTime(nowYear, nowMonth, 1).weekday;
    createCalendar(time, dayFirstMonth);
    getMonth(month);
    getYear(year);

    WidgetsBinding.instance?.addPostFrameCallback((_) {
      controllerScroll.animateToItem(
          controllerScroll.selectedItem + (nowMonth - 1),
          duration: const Duration(microseconds: 1),
          curve: Curves.easeOut);
    });

    WidgetsBinding.instance?.addPostFrameCallback((_) {
      controllerScrollYear.animateToItem(
          controllerScrollYear.selectedItem + (nowYear - (nowYear - 1)),
          duration: Duration(microseconds: 1),
          curve: Curves.easeOut);
    });
  }
}
