import Flutter
import UIKit
import AVFoundation


public class SwiftUrlAudioStreamPlugin: NSObject, FlutterPlugin {
  let audioSession = AVAudioSession.sharedInstance()

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

    }else{

    }


  }

  lazy var playerQueue : AVQueuePlayer = {
    return AVQueuePlayer()
  }()

  private func start(url : String){

    do{
      try AVAudioSession.sharedInstace().setCategory(AVAudioSession.Category.playback)
      do{
        try audioSession.setActive(true)
      } catch let error as NSError{
        NSLog("\n\(error.localizedDescription)")
      }
    } catch{
      NSLog("\n Failed category set")
    }
    let u = URL(string : url)!

    let p = AVPlayerItem.init(url : u)
    self.playerQueue.insert(p, after: nil)
    self.playerQueue.play()
  }

  private func stop(){
    self.playerQueue.removeAllItems()
    do{
      try AVAudioSession.sharedInstace().setCategory(AVAudioSession.Category.playback, options: [.mixWithOthers])
      do{
        try audioSession.setActive(false, options: [.notifyOthersOnDeactivation])
      } catch let error as NSError{
        NSLog("\n\(error.localizedDescription)")
      }
    } catch {
      NSLog("\n Failed removal")
    }
  }

}
