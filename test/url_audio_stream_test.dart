import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:url_audio_stream/url_audio_stream.dart';

void main() {
  const MethodChannel channel = MethodChannel('url_audio_stream');

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  // test('getPlatformVersion', () async {
  //   expect(await AudioStream.platformVersion, '42');
  // });
}
