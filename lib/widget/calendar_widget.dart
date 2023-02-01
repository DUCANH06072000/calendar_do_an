import 'package:calendar_do_an/resources/style/color.dart';
import 'package:calendar_do_an/untils/log/log_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CalendarWidget extends StatelessWidget {
  String time;
  CalendarWidget({required this.time, Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        SizedBox(
          height: 20.h,
        ),
        Center(
          child: Text(time,
              style: const TextStyle(
                  color: AppColor.black100,
                  fontWeight: FontWeight.w600,
                  fontSize: 16)),
        ),
        Container(
            height: 50.h,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 7,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    margin: EdgeInsets.only(left: 30.w),
                    height: 50.h,
                    child: Center(
                        child: Text(
                      index + 2 == 8 ? "CN" : 'T${index + 2}',
                      style: const TextStyle(color: AppColor.gray2),
                    )),
                  );
                })),
        Container(
            height: 300.h,
            margin: EdgeInsets.only(left: 10.w,right: 10.w),
            child: GridView.builder(
                itemCount: 30,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 7,
                    crossAxisSpacing: 0.0,
                    mainAxisSpacing: 4.0),
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      TextButton(onPressed:(){
                        Log().e("${index+1}");
                      }, child:  Text("${index + 1}",style: TextStyle(color: AppColor.black,fontWeight: FontWeight.w600),),)

                    ],
                  );
                })),
      ],
    );
  }
}
