import 'dart:async';

import 'package:flutter/services.dart';

class AudioStream{
  String _url;
  static const MethodChannel _channel = const MethodChannel('url_audio_stream');

  //constructor
  AudioStream(String url){
    this._url = url;
  }

  //method start an audio stream
  Future <void> start() async{
    try{
      await _channel.invokeMethod(_url.toString(), "start");
    } on PlatformException catch (e){
      print("Stream start error : $e");
    }
  }

  //method to stop an audio stream
  Future <void> stop() async{
    try{
      await _channel.invokeMethod(_url.toString(), "stop");
    } on PlatformException catch (e){
      print("Stream stop error : $e");
    }
  }

  //method to pause an audio stream
  Future <void> pause() async{
    try{
      await _channel.invokeMethod(_url.toString(), "pause");
    } on PlatformException catch (e){
      print("Stream pause error : $e");
    }
  }

  //method to resume an audio stream
  Future <void> resume() async{
    try{
      await _channel.invokeMethod(_url.toString(), "resume");
    } on PlatformException catch (e){
      print("Stream resume error : $e");
    }
  }

}



// class UrlAudioStream {
//   static const MethodChannel _channel =
//       const MethodChannel('url_audio_stream');

//   static Future<String> get platformVersion async {
//     final String version = await _channel.invokeMethod('getPlatformVersion');
//     return version;
//   }
// }
