import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'net_dio_request_method_channel.dart';

abstract class NetDioRequestPlatform extends PlatformInterface {
  /// Constructs a NetDioRequestPlatform.
  NetDioRequestPlatform() : super(token: _token);

  static final Object _token = Object();

  static NetDioRequestPlatform _instance = MethodChannelNetDioRequest();

  /// The default instance of [NetDioRequestPlatform] to use.
  ///
  /// Defaults to [MethodChannelNetDioRequest].
  static NetDioRequestPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [NetDioRequestPlatform] when
  /// they register themselves.
  static set instance(NetDioRequestPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
