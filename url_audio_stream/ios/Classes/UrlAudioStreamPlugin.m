#import "UrlAudioStreamPlugin.h"
#import <url_audio_stream/url_audio_stream-Swift.h>

@implementation UrlAudioStreamPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftUrlAudioStreamPlugin registerWithRegistrar:registrar];
}
@end
