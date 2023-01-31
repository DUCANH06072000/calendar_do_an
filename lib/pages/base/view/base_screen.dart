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

  /// Lấy chiều rộng màn hình
  double getWidth() {
    return MediaQuery.of(context).size.width;
  }

  /// Lấy chiều cao màn hình
  double getHeight() {
    return MediaQuery.of(context).size.height;
  }

  /// Lấy tỉ lệ chiều rộng/chiều cao
  double getRatio() {
    return getWidth() / getHeight();
  }

  /// Lấy chiều cao của statusbar
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
  /// Trả về giao diện thiết kế
  Widget getView();

  /// Trả về có mở rộng body cả phía sau appbar (appbar gốc)
  bool isExtendBodyBehindAppBar();

  /// Trả về có đẩy giao diện theo bàn phím hay không: true - đẩy, false - không đẩy
  bool isResizeToAvoidBottomInset();

  /// Trả về icon statusbar theme: true - tối, false - sáng
  bool isIconBrightnessLight();

  /// Trả về giao diện getView có tràn statusbar hay không
  bool isStatusBarOverflow();

  /// Trả về widget background
  Widget getBackground();

  /// Trả về widget indicator
  Widget getIndicator();
}
