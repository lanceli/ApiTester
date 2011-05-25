//
//
//
#import "ATTencent.h"

@implementation ATTencent

-(id)initWithApis:(NSArray *)apis
{
    self = [super init];
    self.apis = apis;
    _title = @"腾讯微博";
    _description = [NSString stringWithFormat:@"Total %d APIs,open.t.qq.com",[_apis count]];
    _appKey = @"9bacf000008941dca9dd50b5e9e8ae06";
    _appSecret = @"a3afac95fa82822bef92bbb4b868cfde";
    _oauthRequestURL = [NSURL URLWithString:@"https://open.t.qq.com/cgi-bin/request_token"];
    _oauthAccessURL = [NSURL URLWithString:@"https://open.t.qq.com/cgi-bin/access_token"];
    _oauthAuthorizeURL = [NSURL URLWithString:@"https://open.t.qq.com/cgi-bin/authorize"];

    return self;
}
@end
