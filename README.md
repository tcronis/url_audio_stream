# url_audio_stream

Dart plugin to live stream audio URLs. The package will accept both HTTP and HTTPs URLs for streaming. Specifics will be discussed below for native designs, limitations, and implementations. Any help would be greatly appreciated if possible! 

## Android
The Android MediaPlayer was used for audio streaming over HTTP/HTTPS. Refer to the [Android](https://developer.android.com/reference/android/media/MediaPlayer.html) for information about the MediaPlayer. The player uses the setAudioAttributes method for setting up the MediaPlayer as of now (11/9/19) which was implemented in API level 21. Later on, an implementation will include the setAudioStreamType for API levels lower than 26 (to API level 1).

### HTTP Streams
Android requires an edit to your android manifest to allow connection to non-HTTP sources, follow this [link](https://stackoverflow.com/questions/51902629/how-to-allow-all-network-connection-types-http-and-https-in-android-9-pie) to edit the manifest for clear text traffic.  
