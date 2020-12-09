#import "FlutterUnionPayPlugin.h"
#if __has_include(<flutter_union_pay/flutter_union_pay-Swift.h>)
#import <flutter_union_pay/flutter_union_pay-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "flutter_union_pay-Swift.h"
#endif

@implementation FlutterUnionPayPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftFlutterUnionPayPlugin registerWithRegistrar:registrar];
}
@end
