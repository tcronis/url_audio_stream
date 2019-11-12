# url_audio_stream

Dart plugin to live stream audio URLs. The package will accept both HTTP and HTTPs URLs for streaming. Specifics will be discussed below for native designs, limitations, and implementations. Any help would be greatly appreciated if possible! 

## Usage
**Add the dependency**
```dart
dev_dependencies:
  url_audio_stream:
```
**Import the package into your dart file**
```dart
import 'package:url_audio_stream/url_audio_stream.dart';
```
**Functions and usage**
```dart
AudioStream stream = new AudioStream("https://your_url_goes_here.com");
stream.start();
stream.pause();
stream.resume();
stream.stop();
```

## Android
The Android MediaPlayer was used for audio streaming over HTTP/HTTPS. Refer to the [Android](https://developer.android.com/reference/android/media/MediaPlayer.html) for information about the MediaPlayer. The player uses [setAudioAttributes](https://developer.android.com/reference/android/media/MediaPlayer.html#setAudioAttributes(android.media.AudioAttributes)) method for setting up the MediaPlayer for API levels over 26. Anything under that API level will use [setAudioStreamType](https://developer.android.com/reference/android/media/MediaPlayer.html#setAudioStreamType(int)) method, which was deprecated in API level 26. Due to this adaption, the flutter compiler will give a message that the plugin is using a deprecated method.

### HTTP Streams
Android requires an edit to your android manifest to allow connection to non-HTTP sources, follow this [link](https://stackoverflow.com/questions/51902629/how-to-allow-all-network-connection-types-http-and-https-in-android-9-pie) to edit the manifest for clear text traffic. 


## iOS
The Swift AVPlayer was used for the implementation over HTTP/HTTPS. Refer to the [Apple](https://developer.apple.com/documentation/avfoundation/avplayer) site for information about the AVPlayer. The player was designed in Swift 5 and requires a change in the Info.plist if you need to HTTP stream. According to the Apple article, iOS SDK 4.0+ is required for streaming.

### HTTP Streams
For the clear text traffic, a change will need to be done in XCode on the Runner.xcworkspace file. The [NSAppTransportSecurity](https://developer.apple.com/documentation/bundleresources/information_property_list/nsapptransportsecurity) flag will need to be changed. It is recommended that you add an exception to the site you are streaming, rather than allowing all HTTP traffic. You can follow [this](https://stackoverflow.com/questions/31216758/how-can-i-add-nsapptransportsecurity-to-my-info-plist-file) StackOverflow link for changing or adding domains for streaming. 