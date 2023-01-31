import 'dart:async';
import 'package:calendar_do_an/data/model/input_error.dart';
import 'package:calendar_do_an/resources/constraint/constant.dart';
import 'package:calendar_do_an/untils/connection/connection_until.dart';
import "package:dio/dio.dart";

import 'ws_config.dart';

class HttpUtil {
  static final HttpUtil _instance = HttpUtil._internal();
  late Dio dio;
  bool isRefreshToken = false;

  factory HttpUtil() => _instance;

  HttpUtil._internal() {
    dio = Dio(getOptions());

    dio.interceptors.add(InterceptorsWrapper(onRequest: (options, handler) {
      // Do something before request is sent
      handler.next(options);
    }, onResponse: (response, handler) {
      // Do something with response data
      isRefreshToken = false;
      return handler.next(response); // continue
    }, onError: (DioError error, handler) async {
      // Do something with response error
      if (error.response?.statusCode == 401 && !isRefreshToken) {
        isRefreshToken = true;
        // final newToken = await refreshToken();
        // error.requestOptions.headers['Authorization'] = 'Bearer $newToken';
        // return _retry(error.requestOptions);
      }
      return handler.next(error);
    }));
    //logging
    dio.interceptors.add(LogInterceptor(responseBody: true));
  }

  /// Set authorization option
  setTokenToOptions() {
    // if (Auth().accessToken != "") {
    //   dio.options.headers['Authorization'] = 'Bearer ${Auth().accessToken}';
    // }
  }

  /// Set language option
  setLanguageToOptions() async {
    // 'vi, vi-VN'
  //  dio.options.headers['Accept-Language'] = Device().getLanguage();
  }

  /// Set token empty
  setTokenEmpty() {
    dio.options.headers['Authorization'] = "";
  }

  /// Get base option
  BaseOptions getOptions() {
    BaseOptions options = BaseOptions();
    options.baseUrl = WsConfig.BASE_URL;
    // options.receiveDataWhenStatusError = true;
    // options.receiveTimeout = 12000;
    options.connectTimeout = 8000;
    options.contentType = 'application/json';
    return options;
  }

  /// GET request
  Future get(String path,
      {dynamic params,
        Options? options,
        CancelToken? cancelToken,
        String? baseUrl}) async {
    try {
      if(await ConnectionUntil.isNetworkConnected()){
        setTokenToOptions();
        setLanguageToOptions();
        dio.options.baseUrl = baseUrl ?? WsConfig.BASE_URL;
        var response = await dio.get(path,
            queryParameters: params, cancelToken: cancelToken);
        return response;
      }else {
        return getResponse(Constant.STATUS_CODE_NO_INTERNET, "Không có kết nối, vui lòng kiểm tra internet sau đó thử lại", null);
      }
    } on DioError catch (e) {
      return getResponseError(e);
    }
  }

  ///POST request
  Future post(String path,
      {dynamic params,
        Options? options,
        CancelToken? cancelToken,
        String? baseUrl}) async {
    try {
      if(await ConnectionUntil.isNetworkConnected()){
        setTokenToOptions();
        setLanguageToOptions();
        dio.options.baseUrl = baseUrl ?? WsConfig.BASE_URL;
        var response = await dio.post(path,
            options: options, data: params, cancelToken: cancelToken);
        return response;
      }else {
        return getResponse(Constant.STATUS_CODE_NO_INTERNET, "Không có kết nối, vui lòng kiểm tra internet sau đó thử lại", null);
      }
    } on DioError catch (e) {
      return getResponseError(e);
    }
  }

  /// DOWNLOAD request
  Future download(String path, savePath,
      {dynamic params,
        Options? options,
        ProgressCallback? onReceiveProgress,
        CancelToken? cancelToken}) async {
    try {
      if(await ConnectionUntil.isNetworkConnected()){
        setTokenToOptions();
        setLanguageToOptions();
        var response = await dio.download(path,
            savePath,
            onReceiveProgress: onReceiveProgress,
            cancelToken: cancelToken);
        return response.data;
      }else {
        return getResponse(Constant.STATUS_CODE_NO_INTERNET, "Không có kết nối, vui lòng kiểm tra internet sau đó thử lại", null);
      }
    } on DioError catch (e) {
      return getResponseError(e);
    }
  }

  Response getResponseError(DioError error) {
    switch (error.type) {
      case DioErrorType.cancel:
        return getResponse(Constant.STATUS_CODE_CANCEL, "Hủy yêu cầu kết nối", null);
      case DioErrorType.connectTimeout:
        return getResponse(Constant.STATUS_CODE_TIMEOUT, "Máy chủ không phản hồi", null);
      case DioErrorType.sendTimeout:
        return getResponse(Constant.STATUS_CODE_SEND_TIMEOUT, "Gửi lại yêu cầu kết nối", null);
      case DioErrorType.receiveTimeout:
        return getResponse(Constant.STATUS_CODE_RECEIVE_TIMEOUT, "Thời gian nhận quá hạn", null);
      case DioErrorType.response:
        try {
          if (error.response?.data.toString() == "") {
            return getResponse(error.response!.statusCode!,
                error.response!.statusMessage!, error.response?.data);
          } else {
            InputError inputError = InputError.fromJson(error.response?.data);
            return getResponse(
                inputError.statusCode,
                inputError.message,
                error.response?.data['data']);
          }
        } on Exception catch (_) {
          return getResponse(Constant.STATUS_CODE_UNKNOW, "Lỗi kết nối đến máy chủ", null);
        }

      default:
        return getResponse(
            Constant.STATUS_CODE_UNKNOW, /*error.message*/ "Lỗi kết nối đến máy chủ", null);
    }
  }

  Response getResponse(int code, String message, dynamic data) {
    Map<String, dynamic> responseData = {
      'statusCode': code,
      'message': message,
      'data': data
    };
    Response response = Response(
        data: responseData,
        requestOptions: RequestOptions(
          path: "",
        ),
        statusCode: code,
        statusMessage: message);
    return response;
  }

}
