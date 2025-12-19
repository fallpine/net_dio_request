
import 'net_dio_request_platform_interface.dart';

class NetDioRequest {
  Future<String?> getPlatformVersion() {
    return NetDioRequestPlatform.instance.getPlatformVersion();
  }
}
