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
import java.io.IOException;
import android.media.AudioAttributes;
import android.net.Uri;
import android.os.Build.VERSION; 

public class UrlAudioStreamPlugin implements MethodCallHandler {
  private static MediaPlayer player = null;
  private static final String channel = "url_audio_stream";
  private String url = "";
  private static final int sdk_build_version = android.os.Build.VERSION.SDK_INT;
  private static final boolean use_deprecated = sdk_build_version < 26 ? true : false;

  //Registering the communication channel between android and java
  public static void registerWith(Registrar registrar) {
    final MethodChannel channel = new MethodChannel(registrar.messenger(), "url_audio_stream");
    channel.setMethodCallHandler(new UrlAudioStreamPlugin());
  }

  //When the flutter API accesses the cold, this will decide on the action to take based on what is passed
  @Override
  public void onMethodCall(MethodCall call, Result result) {
    url = call.method.toString();
    String action = call.arguments().toString();
    if(action.equals("start")){
      initializePlayer();
      startPlayer();
    } else if(action.equals("stop")){
      stopPlayer();
    } else if(action.equals("pause")){
      pausePlayer();
    } else{
      resumePlayer();
    }
  }

  //setting the data source for the mediaplayer object, based on android operating system level (API)
  private void initializePlayer(){
    player = new MediaPlayer();
    try{
      if(use_deprecated == false){
        player.setAudioAttributes(new AudioAttributes.Builder()
        .setUsage(AudioAttributes.USAGE_MEDIA)
        .setContentType(AudioAttributes.CONTENT_TYPE_MUSIC)
        .build());
      }else{
        player.setAudioStreamType(AudioManager.STREAM_MUSIC);
      }
      player.setDataSource(url);
    } catch (IllegalArgumentException e){
      e.printStackTrace();
    } catch (IllegalStateException e){
      e.printStackTrace();
    } catch (IOException e){
      e.printStackTrace();
    }
  }

  //starting the player, will run in async to avoid the main thread from waiting
  private void startPlayer(){
    try{
      if(player != null){
        player.prepareAsync();
        player.setOnPreparedListener(new MediaPlayer.OnPreparedListener() {
          public void onPrepared(MediaPlayer mp) {
            try{
              player.start();
            } catch (IllegalStateException e){
              e.printStackTrace();
            }
          }
        });
      }
    } catch (IllegalStateException e){
      e.printStackTrace();
    } catch (Exception e){
      e.printStackTrace();
    }
  }

  //stopping the mediaplayer and setting all objects back to their original states
  private void stopPlayer(){
    try{
      if(player != null){
        player.stop();
        player.reset();
        player.release();
        player = null;
      }
    } catch (IllegalStateException e){
      e.printStackTrace();
    } catch (Exception e){
      e.printStackTrace();
    }
  }

  //pausing the player if it is already set and playing
  private void pausePlayer(){
    try{
      if(player != null && player.isPlaying()){
        player.pause();
      }
    } catch (IllegalStateException e){
      e.printStackTrace();
    } catch (Exception e){
      e.printStackTrace();
    }
  }

  //resuming the player which is just starting the audio again, if the player was initialized
  private void resumePlayer(){
    try{
      if(player != null && !player.isPlaying()){
        player.start();
      }
    } catch (IllegalStateException e){
      e.printStackTrace();
    } catch (Exception e){
      e.printStackTrace();
    }
  }
}
