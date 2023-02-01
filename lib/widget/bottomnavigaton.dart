import 'dart:core';

import 'package:calendar_do_an/resources/style/color.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../generated/assets.dart';
import '../../../../widget/tbutton.dart';

class BottomNavigation extends StatefulWidget {
  final Function(int position) onPageChange;

  const BottomNavigation({Key? key, required this.onPageChange})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _BottomNavigationState(onPageChange);
  }
}

class _BottomNavigationState extends State<BottomNavigation> {
  final Function(int position) onPageChange;
  int index = 0;

  _BottomNavigationState(this.onPageChange);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 72,
      decoration: BoxDecoration(
          color: AppColor.white,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                blurRadius: 12,
                spreadRadius: 5),
          ]),
      child: Column(children: [
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(children: [
            TButton(
                child: Column(children: [
                  const SizedBox(height: 4),
                  Text(
                    tr('navigation.home'),
                    style: TextStyle(
                      fontSize: 12,
                      fontFamily: 'RobotoRegular',
                      fontWeight: FontWeight.w400,
                      color: index == 0 ? AppColor.orange40 : AppColor.gray1,
                    ),
                  )
                ]),
                onPressed: () {
                  setState(() {
                    index = 0;
                    onPageChange(index);
                  });
                }),
            Expanded(child: Container()),
            TButton(
                child: Column(
                  children: [
                    const SizedBox(height: 4),
                    Text(
                      tr('navigation.shop'),
                      style: TextStyle(
                        fontSize: 12,
                        fontFamily: 'RobotoRegular',
                        fontWeight: FontWeight.w400,
                        color: index == 1 ? AppColor.orange40 : AppColor.gray1,
                      ),
                    )
                  ],
                ),
                onPressed: () {
                  setState(() {
                    index = 1;
                    onPageChange(index);
                  });
                }),
            Expanded(child: Container()),
            TButton(
                child: Column(
                  children: [
                    const SizedBox(height: 4),
                    Text(
                      tr('navigation.warranty'),
                      style: TextStyle(
                        fontSize: 12,
                        fontFamily: 'RobotoRegular',
                        fontWeight: FontWeight.w400,
                        color: index == 2 ? AppColor.orange40 : AppColor.gray1,
                      ),
                    )
                  ],
                ),
                onPressed: () {
                  setState(() {
                    index = 2;
                    onPageChange(index);
                  });
                }),
            Expanded(child: Container()),
            TButton(
                child: Column(
                  children: [
                    const SizedBox(height: 4),
                    Text(
                      tr('navigation.account'),
                      style: TextStyle(
                        fontSize: 12,
                        fontFamily: 'RobotoRegular',
                        fontWeight: FontWeight.w400,
                        color: index == 3 ? AppColor.orange40 : AppColor.gray1,
                      ),
                    )
                  ],
                ),
                onPressed: () {
                  setState(() {
                    index = 3;
                    onPageChange(index);
                  });
                }),
          ]),
        ),
        const SizedBox(height: 16)
      ]),
    );
  }
}
