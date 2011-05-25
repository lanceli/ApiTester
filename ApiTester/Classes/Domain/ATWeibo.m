//
//
//
#import "ATWeibo.h"

@implementation ATWeibo

-(id)initWithApis:(NSArray *)apis
{
    self = [super init];
    self.apis = apis;
    _title = @"新浪微博";
    _description = [NSString stringWithFormat:@"Total %d APIs,open.weibo.com",[_apis count]];
    _appKey = @"261512368";
    _appSecret = @"5884a2b28a9cca42c2df5dfd8b80f0e6";
    _oauthRequestURL = [NSURL URLWithString:@"http://api.t.sina.com.cn/oauth/request_token"];
    _oauthAccessURL = [NSURL URLWithString:@"https://api.t.sina.com.cn/oauth/access_token"];
    _oauthAuthorizeURL = [NSURL URLWithString:@"https://api.t.sina.com.cn/oauth/authorize"];

    return self;
}
@end
