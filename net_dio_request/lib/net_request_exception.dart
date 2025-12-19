/// 网络请求异常类
class NetRequestException implements Exception {
  /// Property
  // 异常code
  final int? code;
  // 异常消息
  final String message;

  // 数据解析失败
  static const int dataParseError = -10000;
  // dio异常
  static const int dioError = -10001;

  /// 构造函数
  const NetRequestException({required this.code, required this.message});

  @override
  String toString() {
    return "code: $code, message: $message";
  }
}
