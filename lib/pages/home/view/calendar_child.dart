import 'package:calendar_do_an/pages/home/view/home_screen.dart';
import 'package:calendar_do_an/widget/calendar_widget.dart';
import 'package:calendar_do_an/widget/infor_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../resources/style/color.dart';
import '../../../untils/log/log_util.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension CalendarHome on HomeScreen {
  Widget calendar() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        SizedBox(
          height: 20.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// chọn tháng
            Container(
                height: 31.h,
                width: 75.w,
                decoration: const BoxDecoration(
                  border: Border(bottom: BorderSide(width: 2), top: BorderSide(width: 2)),
                ),
                child: ListWheelScrollView(
                  controller: controller.controllerScroll,
                  perspective: 0.007,
                  diameterRatio: 2,
                  physics: FixedExtentScrollPhysics(),
                  onSelectedItemChanged: (index) {
                    controller.chooseMonth(index);
                  },
                  itemExtent: 40,
                  children: controller.month,
                )),
            SizedBox(
              width: 30.w,
            ),

            /// chọn năm
            Container(
                height: 31.h,
                width: 70.w,
                decoration: const BoxDecoration(
                  border: Border(bottom: BorderSide(width: 2), top: BorderSide(width: 2)),
                ),
                child: ListWheelScrollView(
                  controller: controller.controllerScrollYear,
                  perspective: 0.007,
                  physics: FixedExtentScrollPhysics(),
                  onSelectedItemChanged: (index) {
                    controller.chooseYear(index);
                  },
                  itemExtent: 50,
                  children: controller.year,
                )),
          ],
        ),
        Container(
            height: 50.h,
            child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: 7,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    padding: EdgeInsets.only(left: 33.w),
                    child: Center(
                        child: Text(
                      index + 2 == 8 ? "CN" : 'T${index + 2}',
                      style: const TextStyle(color: AppColor.gray2),
                    )),
                  );
                })),

        Container(
            height: 320.h,
            margin: EdgeInsets.only(left: 10.w, right: 10.w),
            child: GridView.builder(
              physics: NeverScrollableScrollPhysics(),
                padding: EdgeInsets.only(bottom: 20.h),
                itemCount: controller.calendarBloc.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 7,
                    crossAxisSpacing: 0.0,
                    mainAxisSpacing: 4.0),
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      TextButton(
                        onPressed: () {},
                        child: Visibility(
                          child: Container(
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    "${controller.calendarBloc[index]}",
                                    style: TextStyle(
                                        color: controller.colorText(index),
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Text("2 sự kiện",style: TextStyle(fontSize: 5,color: controller.colorText(index)),)
                                ],
                              ),
                            ),
                            decoration: BoxDecoration(
                                color: controller.colorsBox(index),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(18))),
                            width: 30.w,
                            height: 30.h,
                          ),
                          visible: controller.hideDay(index),
                        ),
                      ),
                    ],
                  );
                })),
      ],
    );
  }
}
