import 'package:calendar_do_an/data/model/navibar.dart';
import 'package:calendar_do_an/generated/assets.dart';
import 'package:calendar_do_an/routes/app_routes.dart';
import 'package:calendar_do_an/untils/log/log_util.dart';
import 'package:calendar_do_an/widget/infor_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
class NavBar extends StatelessWidget {
  NavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          banner(),
          body(),
        ],
      ),
    );
  }

  Widget banner() {
    return Container(
      margin: EdgeInsets.only(top: 50.h),
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                width: 140.w,
                height: 140.h,
                margin: EdgeInsets.only(left: 50, right: 50),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  border: Border.all(
                    color: Colors.red,
                    style: BorderStyle.solid,
                    width: 4.0,
                  ),
                ),
                child: Image.asset(Assets.imagesIconMenu),
              ),
              Container(
                width: 42,
                height: 42,
                margin: EdgeInsets.only(left: 150, top: 100),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.red),
                child: IconButton(
                  onPressed: () {},
                  icon: Image.asset(Assets.imagesLogo),
                ),
              )
            ],
          ),
          SizedBox(
            height: 16.h,
          ),
          Container(
              child: TextWidget(
            label: "Nguyễn Đức Anh",
            size: 16,
            fontWeight: FontWeight.w700,
          )),
          SizedBox(
            height: 16.h,
          ),
          Container(
              child: TextWidget(
            label: "Bosin233@gmail.com",
            size: 16,
            fontWeight: FontWeight.w500,
          )),
        ],
      ),
    );
  }

  Widget body() {
    List<NaviBar> data = [
      NaviBar(Assets.imagesHomePage, "Trang chủ"),
      NaviBar(Assets.imagesIcons8Business50, "Tất cả công việc"),
      NaviBar(Assets.imagesIcons8Progress64, "Tiến độ làm việc"),
      NaviBar(Assets.imagesIcons8All58, "Công việc đã hoàn thành"),
      NaviBar(Assets.imagesIcons8Facebook, "Phản hồi"),
      NaviBar(Assets.imagesIcons8Information, "Thông tin liên hệ"),
    ];
    return Expanded(
        child: ListView.builder(
            padding: const EdgeInsets.all(8),
            itemCount: data.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                  height: 30.h,
                  margin: EdgeInsets.only(bottom: 18.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Image.asset(
                        data[index].icon,
                        width: 24.w,
                        height: 24.h,
                      ),
                      SizedBox(
                        width: 12.w,
                      ),
                      TextButton(
                        onPressed: () {
                            if(index==3){
                              Get.toNamed(Routes.JOBDONE);
                            }
                            else if(index == 0){
                              Get.toNamed(Routes.MAIN);
                            }
                        },
                        child: TextWidget(
                          label: data[index].label,
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    ],
                  ));
            }));
  }
}
