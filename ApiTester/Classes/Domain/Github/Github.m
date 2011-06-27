//
//  Github.m
//  ApiTester
//
//  Created by WU Kai on 6/26/11.
//  Copyright 2011 None. All rights reserved.
//

#import "Github.h"
#import "FBConnect.h"

static NSString *kRedirectUri = @"iPhoneApiTester://authorize?provider=Github";

@implementation Github

@synthesize accessToken=_accessToken,
        sessionDelegate=_sessionDelegate;

- (id)initWithClientId:(NSString *)clientId
                Secret:(NSString *)clientSecret
{
    self = [super init];
    if (self) {
        _clientId = clientId;
        _clientSecret = clientSecret;
    }
    return self;
}

- (void)dealloc
{
    [_accessToken release];
    [super dealloc];
}

- (void)authorize:(NSArray *)permissions
         delegate:(id<GHSessionDelegate>)delegate
{
    self.sessionDelegate = delegate; 
    NSMutableDictionary* params = [NSMutableDictionary dictionaryWithObjectsAndKeys:
        _clientId, @"client_id",
        kRedirectUri, @"redirect_uri",
        nil];
    NSString *url = [FBRequest serializeURL:@"https://github.com/login/oauth/authorize" params:params];
    BOOL didOpenOtherApp = NO;
    didOpenOtherApp = [[UIApplication sharedApplication] openURL:[NSURL URLWithString:url]];
}

- (BOOL)handleOpenURL:(NSURL *)url
{
    NSArray *parameters = [[url query] componentsSeparatedByString:@"&"];
    NSString *code = nil;
    for (NSString *parameter in parameters) {
        if ([parameter hasPrefix:@"code="]) {
            code = [parameter substringFromIndex:5];
            break;
        }
    }
    NSMutableDictionary* params = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                   _clientId, @"client_id",
                                   kRedirectUri, @"redirect_uri",
                                   _clientSecret, @"client_secret",
                                   code, @"code",
                                   nil];
    NSString *accessUrl = [FBRequest serializeURL:@"https://github.com/login/oauth/access_token" params:params];
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:accessUrl]];
    NSURLResponse *response = nil;
    NSError *error = nil;
    NSData *data = [NSURLConnection sendSynchronousRequest:request
                                         returningResponse:&response
                                                     error:&error];
    NSLog(@"Code: %d",[(NSHTTPURLResponse *)response statusCode]);
    NSLog(@"Headers: %@",[(NSHTTPURLResponse *)response allHeaderFields]);
    NSString *body = [[NSString alloc] initWithData:data
                                           encoding:NSUTF8StringEncoding];
    NSLog(@"Body: %@",body);

    parameters = [body componentsSeparatedByString:@"&"];
    for (NSString *parameter in parameters) {
        if ([parameter hasPrefix:@"access_token="]) {
            self.accessToken = [parameter substringFromIndex:13];
            break;
        }
    }

    if (self.accessToken) {
        [self.sessionDelegate ghDidLogin];
    }
    else {
        [self.sessionDelegate ghDidNotLogin:YES];
    }
    [body release];
    return YES;
}

@end
