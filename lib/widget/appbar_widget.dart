import 'package:calendar_do_an/generated/assets.dart';
import 'package:calendar_do_an/resources/style/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class AppBarWidget extends StatelessWidget {
  String title;
  String image;
  final VoidCallback? onPressed;
   AppBarWidget({
     required this.image,
   required this.onPressed,
  required this.title,
  Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(top: 40.h),
          color: Colors.green,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(width: 16.w,),
             IconButton(onPressed: onPressed, icon: Image.asset(image)),
              SizedBox(width: 16.w,),
              Text(title,style: const TextStyle(fontSize: 16,fontWeight: FontWeight.w600,color: AppColor.white),
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget body(){
    return Container(
      child: Image.asset(Assets.imagesHomePage),
    );
  }
}
