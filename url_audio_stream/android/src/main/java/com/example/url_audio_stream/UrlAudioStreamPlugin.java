package com.example.url_audio_stream;

import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugin.common.PluginRegistry.Registrar;


import android.util.Log;
import android.media.MediaPlayer;
import android.media.MediaPlayer.OnBufferingUpdateListener;
import android.media.MediaPlayer.OnPreparedListener;
import android.media.MediaPlayer.OnErrorListener;
import android.media.AudioManager;
import android.media.AudioAttributes;
import android.net.Uri;



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
