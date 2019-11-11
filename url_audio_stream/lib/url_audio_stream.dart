import 'dart:async';

import 'package:flutter/services.dart';

class AudioStream{
  String _url;
  static const MethodChannel _channel = const MethodChannel('url_audio_stream');

  //constructor
  AudioStream(String url){
    this._url = url;
  }

  Future <void> start() async{
    try{
      await _channel.invokeMethod(_url.toString(), "start");
    } on PlatformException catch (e){
      print("Stream start error : $e");
    }
  }

  Future <void> stop() async{
    try{
      await _channel.invokeMethod(_url.toString(), "stop");
    } on PlatformException catch (e){
      print("Stream stop error : $e");
    }
  }

  Future <void> pause() async{
    try{
      await _channel.invokeMethod(_url.toString(), "pause");
    } on PlatformException catch (e){
      print("Stream pause error : $e");
    }

  Future <void> resume() async{
    try{
      await _channel.invokeMethod(_url.toString(), "resume");
    } on PlatformException catch (e){
      print("Stream resume error : $e");
    }
  }

}