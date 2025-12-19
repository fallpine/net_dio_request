import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'net_dio_request_platform_interface.dart';

/// An implementation of [NetDioRequestPlatform] that uses method channels.
class MethodChannelNetDioRequest extends NetDioRequestPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('net_dio_request');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
