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

@end



