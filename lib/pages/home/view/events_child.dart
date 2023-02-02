import 'package:calendar_do_an/generated/assets.dart';
import 'package:calendar_do_an/pages/home/view/home_screen.dart';
import 'package:calendar_do_an/widget/infor_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../resources/style/color.dart';
extension EventsHome on HomeScreen{

  Widget events(){
    return Expanded(child: ListView.builder(
        padding: EdgeInsets.only(left: 25.w,right: 25.w,bottom: 20.h),
        itemCount: 4,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            padding: EdgeInsets.only(bottom: 16.h,top: 16.h),
              decoration: BoxDecoration(border: Border(bottom: BorderSide(color: AppColor.primary))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                 Image.asset(Assets.imagesIcons8Events64,width: 30.w,height: 30.h,),
                  SizedBox(width: 16.w,),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextWidget(label: "2/2/2022"),
                      TextWidget(label: "Hôm nay là sinh nhật thắng đặng")
                    ],
                  )
                ],
              )
          );
        }));
  }
}