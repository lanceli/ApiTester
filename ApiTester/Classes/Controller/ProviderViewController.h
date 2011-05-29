//
//  ProviderViewController.h
//  ApiTester
//
//  Created by WU Kai on 5/26/11.
//  Copyright 2011 None. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kGithubTitle @"Github"
#define kGithubLogo @"octocat"
#define kGithubConsumerKey @"ef4a0ff8a0d391632ccf"
#define kGithubConsumerSecret @"6df83097b04f791cf2261db25827b657ed5fc199"
#define kGithubRequestURL @"https://github.com/login/oauth/request_token"
#define kGithubAccessURL @"https://github.com/login/oauth/access_token"
#define kGithubAuthorizeURL @"https://github.com/login/oauth/authorize"

#define kTwitterTitle @"Twitter"
#define kTwitterLogo @"twitter"
#define kTwitterConsumerKey @"0Qsk6DfLdI3l4Q2RkAzQ"
#define kTwitterConsumerSecret @"WibvD7TFhRpJBcifR4wAiPMR0W6YzQxkKouLv8VVR8"
#define kTwitterRequestURL @"https://api.twitter.com/oauth/request_token"
#define kTwitterAccessURL @"https://api.twitter.com/oauth/access_token"
#define kTwitterAuthorizeURL @"https://api.twitter.com/oauth/authorize"

#define kWeiboTitle @"Sina Weibo"
#define kWeiboLogo @"sina"
#define kWeiboConsumerKey @"261512368"
#define kWeiboConsumerSecret @"5884a2b28a9cca42c2df5dfd8b80f0e6"
#define kWeiboRequestURL @"http://api.t.sina.com.cn/oauth/request_token"
#define kWeiboAccessURL @"http://api.t.sina.com.cn/oauth/access_token"
#define kWeiboAuthorizeURL @"http://api.t.sina.com.cn/oauth/authorize"

#define kTencentTitle @"Tencent Weibo"
#define kTencentLogo @"tencent"
#define kTencentConsumerKey @"9bacf000008941dca9dd50b5e9e8ae06"
#define kTencentConsumerSecret @"a3afac95fa82822bef92bbb4b868cfde"
#define kTencentRequestURL @"https://open.t.qq.com/cgi-bin/request_token"
#define kTencentAccessURL @"https://open.t.qq.com/cgi-bin/access_token"
#define kTencentAuthorizeURL @"https://open.t.qq.com/cgi-bin/authorize"

#define kFacebookTitle @"Facebook"
#define kFacebookLogo @"facebook"
#define kFacebookConsumerKey @""
#define kFacebookConsumerSecret @""
#define kFacebookRequestURL @""
#define kFacebookAccessURL @""
#define kFacebookAuthorizeURL @""

#define kLinkedinTitle @"LinkedIn"
#define kLinkedinLogo @"linkedin"
#define kLinkedinConsumerKey @"nFLzPEU1j30gzFopG_HYt02_7UrqKOQqGyMOCPdmhq3RiSJzb22E8KXU4zj_EcUU"
#define kLinkedinConsumerSecret @"4nqOLn5QRhGt_fSUsQmM75hAOy1Yqes6iJtnVE496SVRu2xTwxfHQ2ZreWPI00bm"
#define kLinkedinRequestURL @"https://api.linkedin.com/uas/oauth/requestToken"
#define kLinkedinAccessURL @"https://api.linkedin.com/uas/oauth/accessToken"
#define kLinkedinAuthorizeURL @"https://api.linkedin.com/uas/oauth/authorize"

@interface ProviderViewController : UITableViewController {
    NSArray *_providers;
}

@property (nonatomic,retain) NSArray *providers;

@end
