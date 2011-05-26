//
//  ProviderViewController.h
//  ApiTester
//
//  Created by WU Kai on 5/26/11.
//  Copyright 2011 None. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kGithubTitle @"Github v2"
#define kGithubConsumerKey @"ef4a0ff8a0d391632ccf"
#define kGithubConsumerSecret @"6df83097b04f791cf2261db25827b657ed5fc199"
#define kGithubRequestURL @"https://github.com/login/oauth/request_token"
#define kGithubAccessURL @"https://github.com/login/oauth/access_token"
#define kGithubAuthorizeURL @"https://github.com/login/oauth/authorize"

#define kTencentTitle @"腾讯微博"
#define kTencentConsumerKey @"9bacf000008941dca9dd50b5e9e8ae06"
#define kTencentConsumerSecret @"a3afac95fa82822bef92bbb4b868cfde"
#define kTencentRequestURL @"https://open.t.qq.com/cgi-bin/request_token"
#define kTencentAccessURL @"https://open.t.qq.com/cgi-bin/access_token"
#define kTencentAuthorizeURL @"https://open.t.qq.com/cgi-bin/authorize"

#define kWeiboTitle @"新浪微博"
#define kWeiboConsumerKey @"261512368"
#define kWeiboConsumerSecret @"5884a2b28a9cca42c2df5dfd8b80f0e6"
#define kWeiboRequestURL @"http://api.t.sina.com.cn/oauth/request_token"
#define kWeiboAccessURL @"http://api.t.sina.com.cn/oauth/access_token"
#define kWeiboAuthorizeURL @"http://api.t.sina.com.cn/oauth/authorize"

@interface ProviderViewController : UITableViewController {
    NSArray *_providers;
}

@end
