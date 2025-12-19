import 'package:dio/dio.dart' as net_request;
import 'package:net_dio_request/net_request_exception.dart';
import 'package:qs_toast/qs_toast.dart';

class NetRequest {
  /// Func
  /// 配置
  void config({
    required Duration? connectTimeout,
    required Duration? receiveTimeout,
  }) {
    dio.options.connectTimeout = connectTimeout;
    dio.options.receiveTimeout = receiveTimeout;
  }

  /// Get
  ///
  /// @throws NetRequestException 该方法会抛出异常，请使用try-catch捕获
  Future<Map<String, dynamic>?> getJson(
    String apiUrl, {
    Map<String, dynamic>? parameters,
    Map<String, dynamic>? headers,
    bool isShowLoading = true,
  }) async {
    if (isShowLoading) {
      QsToast.loading();
    }
    Map<String, dynamic> newHeaders = headers ?? {};

    try {
      final response = await dio.get(
        apiUrl,
        queryParameters: parameters,
        options: net_request.Options(
          headers: newHeaders,
          responseType: net_request.ResponseType.json,
        ),
      );

      if (isShowLoading) {
        QsToast.dismiss();
      }

      if (response.statusCode == 200) {
        if (response.data == null) {
          return null;
        } else if (response.data is Map<dynamic, dynamic>) {
          return response.data as Map<String, dynamic>;
        } else {
          throw NetRequestException(
              code: NetRequestException.dataParseError, message: "数据解析失败");
        }
      } else {
        throw NetRequestException(
            code: response.statusCode, message: response.statusMessage ?? "");
      }
    } catch (e) {
      if (isShowLoading) {
        QsToast.dismiss();
      }
      // 如果已经是NetRequestException，直接抛出
      if (e is NetRequestException) {
        rethrow;
      }
      throw NetRequestException(
          code: NetRequestException.dioError, message: "dio异常: $e");
    }
  }

  Future<String?> getString(
    String apiUrl, {
    Map<String, dynamic>? parameters,
    Map<String, dynamic>? headers,
    bool isShowLoading = true,
  }) async {
    if (isShowLoading) {
      QsToast.loading();
    }
    Map<String, dynamic> newHeaders = headers ?? {};

    try {
      final response = await dio.get(
        apiUrl,
        queryParameters: parameters,
        options: net_request.Options(
          headers: newHeaders,
          responseType: net_request.ResponseType.json,
        ),
      );

      if (isShowLoading) {
        QsToast.dismiss();
      }

      if (response.statusCode == 200) {
        if (response.data == null) {
          return null;
        } else if (response.data is String) {
          return response.data as String;
        } else {
          throw NetRequestException(
              code: NetRequestException.dataParseError, message: "数据解析失败");
        }
      } else {
        throw NetRequestException(
            code: response.statusCode, message: response.statusMessage ?? "");
      }
    } catch (e) {
      if (isShowLoading) {
        QsToast.dismiss();
      }
      // 如果已经是NetRequestException，直接抛出
      if (e is NetRequestException) {
        rethrow;
      }
      throw NetRequestException(
          code: NetRequestException.dioError, message: "dio异常: $e");
    }
  }

  /// Post
  ///
  /// @throws NetRequestException 该方法会抛出异常，请使用try-catch捕获
  Future<Map?> postJson(
    String apiUrl, {
    Map<String, dynamic>? parameters,
    Map<String, dynamic>? headers,
    bool isShowLoading = true,
  }) async {
    if (isShowLoading) {
      QsToast.loading();
    }
    Map<String, dynamic> newHeaders = headers ?? {};

    try {
      final response = await dio.get(
        apiUrl,
        queryParameters: parameters,
        options: net_request.Options(
          headers: newHeaders,
          responseType: net_request.ResponseType.json,
        ),
      );

      if (isShowLoading) {
        QsToast.dismiss();
      }

      if (response.statusCode == 200) {
        if (response.data == null) {
          return null;
        } else if (response.data is Map<dynamic, dynamic>) {
          return response.data as Map<String, dynamic>;
        } else {
          throw NetRequestException(
              code: NetRequestException.dataParseError, message: "数据解析失败");
        }
      } else {
        throw NetRequestException(
            code: response.statusCode, message: response.statusMessage ?? "");
      }
    } catch (e) {
      if (isShowLoading) {
        QsToast.dismiss();
      }
      // 如果已经是NetRequestException，直接抛出
      if (e is NetRequestException) {
        rethrow;
      }
      throw NetRequestException(
          code: NetRequestException.dioError, message: "dio异常: $e");
    }
  }

  /// Config
  NetRequest() {
    dio.options.connectTimeout = const Duration(seconds: 30);
    dio.options.receiveTimeout = const Duration(seconds: 30);
  }

  /// Property
  static net_request.Dio dio = net_request.Dio();

  /// 单例
  static final NetRequest _instance = NetRequest._internal();
  NetRequest._internal();
  static NetRequest get shared => _instance;
}
