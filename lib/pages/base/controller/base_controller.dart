import 'dart:async';
import 'package:calendar_do_an/untils/connection/connection_until.dart';
import 'package:calendar_do_an/untils/log/log_util.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import '../../../data/model/input_error.dart';
import '../../../resources/constraint/constant.dart';


abstract class BaseController extends GetxController
    with WidgetsBindingObserver
    implements BaseControllerAbs {
  BuildContext? context;

  //network
  bool networkState = true;
  StreamSubscription<ConnectivityResult>? networkSubscription;

  RxBool indicatorDisplay = false.obs;
  RxInt state = 0.obs;

  /*
  * Life cycle
  */
  @override
  void onInit() async {
    WidgetsBinding.instance?.addObserver(this);
    networkState = await ConnectionUntil.isNetworkConnected();
    networkSubscription = Connectivity().onConnectivityChanged.listen((ConnectivityResult connectivityResult) {
      if (connectivityResult == ConnectivityResult.mobile) {
        networkState = true;
        onConnectivityChanged(true);
      } else if (connectivityResult == ConnectivityResult.wifi) {
        networkState = true;
        onConnectivityChanged(true);
      }else {
        networkState = false;
        onConnectivityChanged(false);
      }
    });
    showIndicator();
    await onInitData().then((value) {
      hideIndicator();
      refreshScreen();
    });
    onInitScreen();
    super.onInit();
  }

  @override
  void onClose() {
    WidgetsBinding.instance?.removeObserver(this);
    networkSubscription?.cancel();
    onCloseScreen();
    super.onClose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      onResume();
    }
  }


  @override
  void onInitScreen() {}

  @override
  void onResumeScreen() {}

  @override
  void onResume() {}

  @override
  void onPauseScreen() {}

  @override
  void onCloseScreen() {}

  void onConnectivityChanged(bool isConnected) {}

  /// Ki???m tra thi???t b??? c?? k???t n???i m???ng
  bool isNetworkConnected() {
    return networkState;
  }




  /// Hi???n th??? dialog th??ng b??o h???t phi??n ????ng nh???p
  void showEndOfSessionDialog(String message) {
    Get.dialog(
     Container()
    );
  }

  /// Hi???n th??? indicator
  void showIndicator({bool isHideKeyboard = true}) {
    indicatorDisplay.value = true;
    if (isHideKeyboard) {
      hideKeyboard();
    }
  }

  /// ???n indicator
  void hideIndicator() {
    Future.delayed(const Duration(microseconds: 300), () {
      indicatorDisplay.value = false;
    });
  }

  /// ???n b??n ph??m
  void hideKeyboard() {
    if (context != null) {
      FocusScope.of(context!).requestFocus(FocusNode());
    }
  }

  /// Ph??t ??m b??p
  void playBeep() {
    //FlutterBeep.beep();
  }

  /// Hi???n th??? toast
  void showToast(String msg) {
    // Fluttertoast.showToast(
    //     msg: msg,
    //     toastLength: Toast.LENGTH_SHORT,
    //     gravity: ToastGravity.CENTER,
    //     timeInSecForIosWeb: 1,
    //     backgroundColor: AppColor.black80,
    //     textColor: AppColor.black20,
    //     fontSize: 12.0,
    //     webPosition: "center");
  }

  /// Hi???n th??? dialog th??ng b??o th??ng th?????ng
  void showInfoDialog(
      String message, {
        String? title,
        String? textConfirm,
        VoidCallback? onConfirm,
      }) {
    Get.dialog(
        Container()
    );
  }

  /// Hi???n th??? dialog th??ng b??o th??nh c??ng
  void showSuccessDialog(
      String message, {
        String? title,
        String? textConfirm,
        VoidCallback? onConfirm,
      }) {
    Get.dialog(
        Container()
    );
  }

  /// Hi???n th??? dialog th??ng b??o l???i
  void showErrorDialog(
      String message, {
        String? title,
        String? textConfirm,
        VoidCallback? onConfirm,
      }) {
    Get.dialog(
        Container()
    );
  }

  /// C???p nh???t giao di???n
  void refreshScreen() {
    state++;
  }

  /// L???y chi???u r???ng m??n h??nh
  double getWidth() {
    return MediaQuery.of(context!).size.width;
  }

  /// L???y chi???u cao m??n h??nh
  double getHeight() {
    return MediaQuery.of(context!).size.height;
  }

  /// B??? l???c api response
  void responseFilter(
      dynamic response, {
        Function(dynamic data)? onSuccess,
       // Function(User user)? onRefreshAuth,
        Function(String message)? onDataRemoved,
        Function(String message)? onEndOfSession,
        Function(String message)? onDataEmpty,
        Function(InputError inputError)? onInputError,
        Function(dynamic data)? onCode412,
        Function()? onCode204,
        Function()? onReconnect,
        Function()? onDownloadSuccess,
        Function(String message)? onCancel,
        Function(String message)? onError,
      }) {
    if (response.runtimeType.toString() == "Response<dynamic>") {
      switch (response.statusCode) {
        case 200:
          if (onSuccess != null) {
            onSuccess(response.data);
          }
          break;
        case 201:
          // if (onRefreshAuth != null) {
          //  // onRefreshAuth(User.fromJson(response.data));
          // }
          break;
        case 204:
          if (onCode204 != null) {
            onCode204();
          }
          break;
        case 209:
          if (onDataEmpty != null) {
            onDataEmpty(InputError.fromJson(response.data).message);
          }
          break;
        case 400:
        case 405:
        case 414:
        case 403:
          if (onInputError != null) {
            onInputError(InputError.fromJson(response.data));
          } else {
            showErrorDialog(InputError.fromJson(response.data).message);
          }
          break;
        case 401:
          if (onEndOfSession != null) {
            onEndOfSession(InputError.fromJson(response.data).message);
          } else {
            showEndOfSessionDialog(InputError.fromJson(response.data).message);
          }
          break;
        case 412:
          if (onCode412 != null) {
            onCode412(response.data);
          } else {
            showErrorDialog(InputError.fromJson(response.data).message);
          }
          break;
        case Constant.STATUS_CODE_NO_INTERNET:
        case Constant.STATUS_CODE_TIMEOUT:
        case Constant.STATUS_CODE_UNKNOW:
          if (onReconnect != null) {
            Get.dialog(
                Container(),
                barrierDismissible: false);
          } else {
            showErrorDialog(InputError.fromJson(response.data).message);
          }
          break;
        case Constant.STATUS_CODE_CANCEL:
          if (onCancel != null) {
            onCancel(InputError.fromJson(response.data).message);
          } else {
            showInfoDialog(InputError.fromJson(response.data).message);
          }
          break;
        default:
          if (onError != null) {
            onError(InputError.fromJson(response.data).message);
          } else {
            showErrorDialog(InputError.fromJson(response.data).message);
          }
      }
    } else if (response.runtimeType.toString() == "ResponseBody") {
      if (onDownloadSuccess != null) {
        onDownloadSuccess();
      } else {
        Log().i(response.runtimeType.toString());
      }
    } else {
      Log().i(response.runtimeType.toString());
    }
  }
}

abstract class BaseControllerAbs {
  /// Kh???i t???o d??? li???u tr?????c khi hi???n th??? m??n h??nh
  Future<void> onInitData();

  /// Khi m??n h??nh ???????c kh???i t???o
  void onInitScreen();

  /// Khi m??n h??nh ???????c m??? l???i sau khi ch???y ???n
  void onResumeScreen();

  /// Sau khi m??n h??nh b??? ???????c lo???i b??? che khu???t 1 ph???n
  void onResume();

  /// Khi m??n h??nh b??? m??n h??nh kh??c che khu???t ho???c ch???y ???n
  void onPauseScreen();

  /// Khi ????ng m??n h??nh
  void onCloseScreen();
}
