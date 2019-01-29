#import "UnofficialMazzumaPlugin.h"
#import <unofficial_mazzuma_plugin/unofficial_mazzuma_plugin-Swift.h>

@implementation UnofficialMazzumaPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftUnofficialMazzumaPlugin registerWithRegistrar:registrar];
}
@end
