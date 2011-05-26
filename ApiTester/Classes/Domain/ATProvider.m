//
//
//
#import "ATProvider.h"

@implementation ATProvider

@synthesize title=_title;
@synthesize description=_description;
@synthesize appKey=_appKey;
@synthesize appSecret=_appSecret;
@synthesize oauthRequestURL=_oauthRequestURL;
@synthesize oauthAccessURL=_oauthAccessURL;
@synthesize oauthAuthorizeURL=_oauthAuthorizeURL;
@synthesize accessToken=_accessToken;
@synthesize accessTokenSecret=_accessTokenSecret;
@synthesize apis=_apis;

- (id)init
{
    self = [super init];
    return self;
}

- (void)dealloc
{
    [_title release];
    [_description release];
    [_appKey release];
    [_appSecret release];
    [_oauthRequestURL release];
    [_oauthAccessURL release];
    [_oauthAuthorizeURL release];
    [_apis release];
    [super dealloc];
}

/**
 *
        _title = @"Github v2";
        _description = [NSString stringWithFormat:@"Total %d APIs,develop.github.com",[_apis count]];
        _appKey = @"ef4a0ff8a0d391632ccf";
        _appSecret = @"6df83097b04f791cf2261db25827b657ed5fc199";
        _oauthRequestURL = [NSURL URLWithString:@"https://github.com/login/oauth/request_token?"];
        _oauthAccessURL = [NSURL URLWithString:@"https://github.com/login/oauth/access_token?"];
        _oauthAuthorizeURL = [NSURL URLWithString:@"https://github.com/login/oauth/authorize?"];
 *
        _title = @"腾讯微博";
        _description = [NSString stringWithFormat:@"Total %d APIs,open.t.qq.com",[_apis count]];
        _appKey = @"9bacf000008941dca9dd50b5e9e8ae06";
        _appSecret = @"a3afac95fa82822bef92bbb4b868cfde";
        _oauthRequestURL = [NSURL URLWithString:@"https://open.t.qq.com/cgi-bin/request_token"];
        _oauthAccessURL = [NSURL URLWithString:@"https://open.t.qq.com/cgi-bin/access_token"];
        _oauthAuthorizeURL = [NSURL URLWithString:@"https://open.t.qq.com/cgi-bin/authorize"];
 *
        _title = @"新浪微博";
        _description = [NSString stringWithFormat:@"Total %d APIs,open.weibo.com",[_apis count]];
        _appKey = @"261512368";
        _appSecret = @"5884a2b28a9cca42c2df5dfd8b80f0e6";
        _oauthRequestURL = [NSURL URLWithString:@"http://api.t.sina.com.cn/oauth/request_token"];
        _oauthAccessURL = [NSURL URLWithString:@"http://api.t.sina.com.cn/oauth/access_token"];
        _oauthAuthorizeURL = [NSURL URLWithString:@"http://api.t.sina.com.cn/oauth/authorize"];
 */

@end



