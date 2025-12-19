import 'package:flutter_test/flutter_test.dart';
import 'package:net_dio_request/net_dio_request.dart';
import 'package:net_dio_request/net_dio_request_platform_interface.dart';
import 'package:net_dio_request/net_dio_request_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockNetDioRequestPlatform
    with MockPlatformInterfaceMixin
    implements NetDioRequestPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final NetDioRequestPlatform initialPlatform = NetDioRequestPlatform.instance;

  test('$MethodChannelNetDioRequest is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelNetDioRequest>());
  });

  test('getPlatformVersion', () async {
    NetDioRequest netDioRequestPlugin = NetDioRequest();
    MockNetDioRequestPlatform fakePlatform = MockNetDioRequestPlatform();
    NetDioRequestPlatform.instance = fakePlatform;

    expect(await netDioRequestPlugin.getPlatformVersion(), '42');
  });
}
