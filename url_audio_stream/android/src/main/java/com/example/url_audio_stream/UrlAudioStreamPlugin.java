package com.example.url_audio_stream;

import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugin.common.PluginRegistry.Registrar;


/** UrlAudioStreamPlugin */
public class UrlAudioStreamPlugin implements MethodCallHandler {
  /** Plugin registration. */
  public static void registerWith(Registrar registrar) {
    final MethodChannel channel = new MethodChannel(registrar.messenger(), "url_audio_stream");
    channel.setMethodCallHandler(new UrlAudioStreamPlugin());
  }


  private static MediaPlayer player;
  private static final String channel = "url_audio_stream";
  private String url = "";


  @Override
  public void onMethodCall(MethodCall call, Result result) {
    System.out.println(call.method + ", " + call.arguments);


    
  }
}
