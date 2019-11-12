import Flutter
import UIKit
import AVFoundation


public class SwiftUrlAudioStreamPlugin: NSObject, FlutterPlugin {
  var player:AVPlayer?
  var playerItem:AVPlayerItem?


  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "url_audio_stream", binaryMessenger: registrar.messenger())
    let instance = SwiftUrlAudioStreamPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    let url : String = call.method
    let action = call.arguments as! String
    if(action == "start"){
      start(url : url)
    }else if(action == "stop"){
      stop()
    }else if(action == "pause"){
      pause()
    }else{
      resume()
    }


  }
  
  private func start(url : String){
    do{
      let u = URL(string: url)
      let playerItem:AVPlayerItem = AVPlayerItem(url: u!)
      try player = AVPlayer(playerItem: playerItem)
      try player!.play()
    } catch {
      NSLog("\n Failed to start playing")
    }

    
  }

  private func stop(){
    if let play = player{
      if player?.rate != 0{
        do{
          try player!.pause()
          try player = nil
        }catch{
          NSLog("\n Failed to stop player")
        }
      }
    }
  }

  private func pause(){
    if let play = player {
      if player?.rate != 0{
        do{
          try player!.pause()
        } catch{
          NSLog("\n Failed to pause player")
        }
      }
    }
  }
  
  private func resume(){
    if let play = player {
      if player?.rate == 0{
        do{
          try player!.play()
        } catch {
          NSLog("\n Failed to resume player")
        }
      }
    }
  }

}
