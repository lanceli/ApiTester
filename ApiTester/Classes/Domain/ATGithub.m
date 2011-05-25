//
//
//
#import "ATGithub.h"

@implementation ATGithub

-(id)initWithApis:(NSArray *)apis
{
    self = [super init];
    self.apis = apis;
    _title = @"Github v2";
    _description = [NSString stringWithFormat:@"Total %d APIs,develop.github.com",[_apis count]];
    _appKey = @"ef4a0ff8a0d391632ccf";
    _appSecret = @"6df83097b04f791cf2261db25827b657ed5fc199";
    _oauthRequestURL = [NSURL URLWithString:@"https://github.com/login/oauth/request_token?"];
    _oauthAccessURL = [NSURL URLWithString:@"https://github.com/login/oauth/access_token?"];
    _oauthAuthorizeURL = [NSURL URLWithString:@"https://github.com/login/oauth/authorize?"];

    return self;
}
@end


