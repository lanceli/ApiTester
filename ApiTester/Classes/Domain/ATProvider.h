//
//
//
#import <Foundation/Foundation.h>

@interface ATProvider : NSObject {
    NSString *_title;
    NSString *_description;
    NSString *_appKey;
    NSString *_appSecret;
    NSURL *_oauthRequestURL;
    NSURL *_oauthAccessURL;
    NSURL *_oauthAuthorizeURL;
    NSMutableString *_accessToken;
    NSMutableString *_accessTokenSecret;
    NSArray *_apis;
}

@property(nonatomic,readonly)NSString *title;
@property(nonatomic,readonly)NSString *description;
@property(nonatomic,readonly)NSString *appKey;
@property(nonatomic,readonly)NSString *appSecret;
@property(nonatomic,readonly)NSURL *oauthRequestURL;
@property(nonatomic,readonly)NSURL *oauthAccessURL;
@property(nonatomic,readonly)NSURL *oauthAuthorizeURL;
@property(nonatomic,copy)NSMutableString *accessToken;
@property(nonatomic,copy)NSMutableString *accessTokenSecret;
@property(nonatomic,retain)NSArray *apis;
@end
