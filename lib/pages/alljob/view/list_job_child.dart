import 'package:calendar_do_an/generated/assets.dart';
import 'package:calendar_do_an/pages/alljob/view/job_screen.dart';
import 'package:calendar_do_an/resources/style/color.dart';
import 'package:calendar_do_an/widget/infor_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
extension ListJob on JobScreen{

  Widget listJob(){
    return Expanded(child: ListView.builder(
        padding: EdgeInsets.only(left: 25.w,right: 25.w,bottom: 20.h),
        itemCount: 4,
        itemBuilder: (BuildContext context, int index) {
          return Container(
              padding: EdgeInsets.only(bottom: 16.h),
              decoration: BoxDecoration(border: Border(bottom: BorderSide(color: AppColor.primary))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
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
                          TextWidget(label: "Hôm nay là sinh nhật thắng đặng"),
                        ],
                      ),
                      SizedBox(width: 30.w,),
                      Checkbox(value: controller.listCheck[index], onChanged: (value){
                          controller.clickCheck(value!, index);
                      }),
                    ],
                  ),
                  SizedBox(height: 8.h,),
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.only(top: 8.h,bottom: 8.h,left: 8.w,right: 8.w),
                        decoration: BoxDecoration(color: Colors.green,borderRadius: BorderRadius.circular(8)),
                        child: TextWidget(label: 'Hoàn thành',color: AppColor.white,size: 10,fontWeight: FontWeight.w600,)
                      ),
                      SizedBox(width: 8.w,),
                      Container(
                          padding: EdgeInsets.only(top: 8.h,bottom: 8.h,left: 8.w,right: 8.w),
                          decoration: BoxDecoration(color: Colors.red,borderRadius: BorderRadius.circular(8)),
                          child: TextWidget(label: 'Hủy',color: AppColor.white,size: 10,fontWeight: FontWeight.w600,)
                      )
                    ],
                  ),
                ],
              )
          );
        }));
  }
}