import 'dart:async';

import 'package:flutter/services.dart';

class UrlAudioStream {
  static const MethodChannel _channel =
      const MethodChannel('url_audio_stream');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}
