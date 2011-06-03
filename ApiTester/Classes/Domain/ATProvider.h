//
//  ATProvider.h
//  ApiTester
//
//  Created by WU Kai on 5/26/11.
//  Copyright 2011 None. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "OAuthConsumer.h"

#define kFacebookTitle @"Facebook"
#define kFacebookLogo @"facebook"
#define kFacebookConsumerKey @""
#define kFacebookConsumerSecret @""
#define kFacebookRequestURL @""
#define kFacebookAccessURL @""
#define kFacebookAuthorizeURL @""
#define kFacebookScript @""

#define kGithubTitle @"Github"
#define kGithubLogo @"octocat"
#define kGithubConsumerKey @""
#define kGithubConsumerSecret @""
#define kGithubRequestURL @""
#define kGithubAccessURL @""
#define kGithubAuthorizeURL @""
#define kGithubScript @""

#define kTwitterTitle @"Twitter"
#define kTwitterLogo @"twitter"
#define kTwitterConsumerKey @"0Qsk6DfLdI3l4Q2RkAzQ"
#define kTwitterConsumerSecret @"WibvD7TFhRpJBcifR4wAiPMR0W6YzQxkKouLv8VVR8"
#define kTwitterRequestURL @"https://api.twitter.com/oauth/request_token"
#define kTwitterAccessURL @"https://api.twitter.com/oauth/access_token"
#define kTwitterAuthorizeURL @"https://api.twitter.com/oauth/authorize"
#define kTwitterScript @"document.getElementsByTagName(\"code\")[0].firstChild.innerText"

#define kWeiboTitle @"Sina Weibo"
#define kWeiboLogo @"sina"
#define kWeiboConsumerKey @"261512368"
#define kWeiboConsumerSecret @"5884a2b28a9cca42c2df5dfd8b80f0e6"
#define kWeiboRequestURL @"http://api.t.sina.com.cn/oauth/request_token"
#define kWeiboAccessURL @"http://api.t.sina.com.cn/oauth/access_token"
#define kWeiboAuthorizeURL @"http://api.t.sina.com.cn/oauth/authorize"
#define kWeiboScript @"document.getElementsByClassName(\"fb\")[0].innerText"

#define kTencentTitle @"Tencent Weibo"
#define kTencentLogo @"tencent"
#define kTencentConsumerKey @"9bacf000008941dca9dd50b5e9e8ae06"
#define kTencentConsumerSecret @"a3afac95fa82822bef92bbb4b868cfde"
#define kTencentRequestURL @"https://open.t.qq.com/cgi-bin/request_token"
#define kTencentAccessURL @"https://open.t.qq.com/cgi-bin/access_token"
#define kTencentAuthorizeURL @"https://open.t.qq.com/cgi-bin/authorize"
#define kTencentScript @"document.getElementById(\"conter\").innerText.replace(/\\D*(\\d*)\\D*/g, \"$1\")"

#define kLinkedinTitle @"LinkedIn"
#define kLinkedinLogo @"linkedin"
#define kLinkedinConsumerKey @"nFLzPEU1j30gzFopG_HYt02_7UrqKOQqGyMOCPdmhq3RiSJzb22E8KXU4zj_EcUU"
#define kLinkedinConsumerSecret @"4nqOLn5QRhGt_fSUsQmM75hAOy1Yqes6iJtnVE496SVRu2xTwxfHQ2ZreWPI00bm"
#define kLinkedinRequestURL @"https://api.linkedin.com/uas/oauth/requestToken"
#define kLinkedinAccessURL @"https://api.linkedin.com/uas/oauth/accessToken"
#define kLinkedinAuthorizeURL @"https://api.linkedin.com/uas/oauth/authorize"
#define kLinkedinScript @"document.getElementsByClassName(\"access-code\")[0].innerText"

#define kAppProviderName @"iPhoneApiTester"
#define kAppPrefix @"iPhoneApiTester"

@class ATProvider;
@protocol ATProviderPropertyProtocol <NSObject>
-(void)setProvider:(ATProvider *)provider;
@end

@interface ATProvider : NSObject {
    OAConsumer *_consumer;
    OAToken *_accessToken;
    NSString *_title;
    UIImage *_logo;
    NSURL *_requestURL;
    NSURL *_accessURL;
    NSURL *_authorizeURL;
    NSString *_script;
}

@property (nonatomic,retain) OAConsumer *consumer;
@property (nonatomic,retain) OAToken *accessToken;
@property (nonatomic,copy) NSString *title;
@property (nonatomic,retain) UIImage *logo;
@property (nonatomic,retain) NSURL *requestURL;
@property (nonatomic,retain) NSURL *accessURL;
@property (nonatomic,retain) NSURL *authorizeURL;
@property (nonatomic,copy) NSString *script;

-(id)initWithKey:(NSString *)key
          secret:(NSString *)secret
           title:(NSString *)title
            logo:(UIImage *)logo
      requestURL:(NSURL *)requestURL
       accessURL:(NSURL *)accessURL
    authorizeURL:(NSURL *)authorizeURL
          script:(NSString *)script;

-(BOOL)isAuthorized;
-(NSComparisonResult)compare:(ATProvider *)provider;
-(OAMutableURLRequest *)oauthRequest:(NSURL *)url;
@end
