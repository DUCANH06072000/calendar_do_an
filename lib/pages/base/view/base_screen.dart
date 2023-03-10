import 'package:calendar_do_an/resources/style/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:focus_detector/focus_detector.dart';

import '../controller/base_controller.dart';

abstract class BaseScreen<T extends BaseController> extends StatelessWidget
    implements BaseScreenView {
  late BuildContext context;
  late T controller;
  late Orientation orientation;

  @override
  Widget build(BuildContext context) {
    this.context = context;
    controller = Get.find<T>();
    controller.context = context;

    return FocusDetector(
      onFocusGained: () {
        controller.onResumeScreen();
      },
      onFocusLost: () {
        controller.onPauseScreen();
      },
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent, // For Android (dark icons)
          statusBarIconBrightness: isIconBrightnessLight()
              ? Brightness.light
              : Brightness.dark, // For Android (dark icons)
          statusBarBrightness: isIconBrightnessLight()
              ? Brightness.dark
              : Brightness.light, // For iOS (dark icons)
        ),
        child: OrientationBuilder(
          builder: (BuildContext context, Orientation orientation) {
            this.orientation = orientation;
            return Stack(children: [
              getBackground(),
              Scaffold(
                resizeToAvoidBottomInset: isResizeToAvoidBottomInset(),
                extendBodyBehindAppBar: isExtendBodyBehindAppBar(),
                backgroundColor: AppColor.transparent,
                body: GestureDetector(
                  onTap: () {
                    FocusManager.instance.primaryFocus?.unfocus();
                  },
                  child: Stack(children: [
                    Column(children: [
                      SizedBox(
                        height: isStatusBarOverflow() ? 0 : 42.h,
                      ),
                      Expanded(
                        child: Obx(
                              () {
                            ScreenUtil.init(context,
                                designSize: const Size(375, 812),
                                splitScreenMode: false,
                                minTextAdapt: false);
                            return Visibility(
                                child: getView(),
                                visible: controller.state > 0);
                          },
                        ),
                      ),
                    ]),
                    getIndicator(),
                  ]),
                ),
              )
            ]);
          },
        ),
      ),
    );
  }

  /// L???y chi???u r???ng m??n h??nh
  double getWidth() {
    return MediaQuery.of(context).size.width;
  }

  /// L???y chi???u cao m??n h??nh
  double getHeight() {
    return MediaQuery.of(context).size.height;
  }

  /// L???y t??? l??? chi???u r???ng/chi???u cao
  double getRatio() {
    return getWidth() / getHeight();
  }

  /// L???y chi???u cao c???a statusbar
  double getStatusBarHeight() {
    return 42.h;
  }

  @override
  bool isExtendBodyBehindAppBar() {
    return false;
  }

  @override
  bool isResizeToAvoidBottomInset() {
    return false;
  }

  @override
  bool isIconBrightnessLight() {
    return true;
  }

  @override
  bool isStatusBarOverflow() {
    return true;
  }

  @override
  Widget getBackground() {
    return Container(
      color: AppColor.background,
    );
  }

  @override
  Widget getIndicator() {
    return Obx(
            () => controller.indicatorDisplay.value ? indicator() : Container());
  }

  /// Indicator
  Widget indicator() {
    return Container(
      child: Center(
        child: SizedBox(
          width: 30.w,
          height: 30.h,
          child: const LoadingIndicator(
              indicatorType: Indicator.ballSpinFadeLoader,
              colors: [AppColor.blue40, AppColor.blue60, AppColor.blue80],
              strokeWidth: 2,
              backgroundColor: Colors.transparent,
              pathBackgroundColor: Colors.transparent),
        ),
      ),
      color: const Color(0xA0000000),
    );
  }
}

abstract class BaseScreenView {
  /// Tr??? v??? giao di???n thi???t k???
  Widget getView();

  /// Tr??? v??? c?? m??? r???ng body c??? ph??a sau appbar (appbar g???c)
  bool isExtendBodyBehindAppBar();

  /// Tr??? v??? c?? ?????y giao di???n theo b??n ph??m hay kh??ng: true - ?????y, false - kh??ng ?????y
  bool isResizeToAvoidBottomInset();

  /// Tr??? v??? icon statusbar theme: true - t???i, false - s??ng
  bool isIconBrightnessLight();

  /// Tr??? v??? giao di???n getView c?? tr??n statusbar hay kh??ng
  bool isStatusBarOverflow();

  /// Tr??? v??? widget background
  Widget getBackground();

  /// Tr??? v??? widget indicator
  Widget getIndicator();
}
