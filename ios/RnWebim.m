#import <React/RCTBridge.h>


@interface RCT_EXTERN_MODULE(RnWebim, NSObject)


RCT_EXTERN_METHOD(resume:
                  (NSDictionary *)params
                  withResolver: (RCTPromiseResolveBlock)resolve
                  withRejecter: (RCTPromiseRejectBlock)reject
)


@end
