#import "RNZendeskChat.h"
#import <ZDCChat/ZDCChat.h>

@implementation RNZendeskChat

RCT_EXPORT_MODULE(RNZendeskChat);

RCT_EXPORT_METHOD(setVisitorInfo:(NSDictionary *)options) {
  [ZDCChat updateVisitor:^(ZDCVisitorInfo *visitor) {
    if (options[@"name"]) {
      visitor.name = options[@"name"];
    }
    if (options[@"email"]) {
      visitor.email = options[@"email"];
    }
    if (options[@"phone"]) {
      visitor.phone = options[@"phone"];
    }
    visitor.shouldPersist = options[@"shouldPersist"] || NO;
  }];
}

RCT_EXPORT_METHOD(startChat:(NSDictionary *)options) {
  [self setVisitorInfo:options];

  dispatch_sync(dispatch_get_main_queue(), ^{
    [ZDCChat startChat:^(ZDCConfig *config) {
      if (options[@"department"]) {
        config.department = options[@"department"];
      }
      if (options[@"tags"]) {
        config.tags = options[@"tags"];
      }
      config.preChatDataRequirements.name       = ZDCPreChatDataRequired;
      config.preChatDataRequirements.email      = options[@"emailNotRequired"] ? ZDCPreChatDataNotRequired : ZDCPreChatDataRequired;
      config.preChatDataRequirements.phone      = options[@"phoneNotRequired"] ? ZDCPreChatDataNotRequired : ZDCPreChatDataRequired;
      config.preChatDataRequirements.department = options[@"departmentNotRequired"] ? ZDCPreChatDataNotRequired : ZDCPreChatDataRequiredEditable;
      config.preChatDataRequirements.message    = options[@"messageNotRequired"] ? ZDCPreChatDataNotRequired : ZDCPreChatDataRequired;
    }];
  });
}

RCT_EXPORT_METHOD(init:(NSString *)zenDeskKey) {
  [ZDCChat initializeWithAccountKey:zenDeskKey];
}

@end