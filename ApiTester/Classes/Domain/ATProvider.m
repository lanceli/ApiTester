//
//  ATProvider.m
//  ApiTester
//
//  Created by WU Kai on 5/26/11.
//  Copyright 2011 None. All rights reserved.
//

#import "ATProvider.h"


@implementation ATProvider

@synthesize consumer=_consumer;
@synthesize accessToken=_accessToken;
@synthesize title=_title;
@synthesize logo=_logo;
@synthesize requestURL=_requestURL;
@synthesize accessURL=_accessURL;
@synthesize authorizeURL=_authorizeURL;

#pragma mark - init

-(id)initWithKey:(NSString *)key
          secret:(NSString *)secret
           title:(NSString *)title
            logo:(UIImage *)logo
      requestURL:(NSURL *)requestURL
       accessURL:(NSURL *)accessURL
    authorizeURL:(NSURL *)authorizeURL
{
    if ((self=[super init])) {
        self.consumer = [[OAConsumer alloc] initWithKey:key
                                                 secret:secret];
        self.accessToken = [[OAToken alloc] initWithUserDefaultsUsingServiceProviderName:kAppProviderName
                                                                                  prefix:title];
        self.title = title;
        self.logo = logo;
        self.requestURL = requestURL;
        self.accessURL = accessURL;
        self.authorizeURL = authorizeURL;
    }
    return self;
}


-(void)dealloc
{
    [_consumer release];
    [_accessToken release];
    [_title release];
    [_logo release];
    [_requestURL release];
    [_accessURL release];
    [_authorizeURL release];
    [super dealloc];
}

-(BOOL)isAuthenticated
{
    return self.accessToken == nil ? NO : YES;
}

-(void)authenticate
{
    NSLog(@"authenticate %@",self.title);
    OAMutableURLRequest *request = [[[OAMutableURLRequest alloc] initWithURL:self.requestURL
                                                                    consumer:self.consumer
                                                                       token:nil
                                                                       realm:nil
                                                           signatureProvider:nil] autorelease];
    [request setHTTPMethod:@"POST"];
    OARequestParameter *p0 = [[OARequestParameter alloc] initWithName:@"oauth_callback" value:@"oob"];
    NSArray *params = [NSArray arrayWithObject:p0];
    [request setParameters:params];

    OADataFetcher *fetcher = [[[OADataFetcher alloc] init] autorelease];
    [fetcher fetchDataWithRequest:request
                         delegate:self
                didFinishSelector:@selector(requestToken:didFinishWithData:)
                  didFailSelector:@selector(requestToken:didFailWithError:)];
    
    [p0 release];
}

#pragma mark - ATOauthDelegate

-(void)requestToken:(OAServiceTicket *)ticket didFinishWithData:(NSData *)data
{
}
-(void)requestToken:(OAServiceTicket *)ticket didFailWithError:(NSError *)error
{
}
-(void)accessToken:(OAServiceTicket *)ticket didFinishWithData:(NSData *)data
{
}
-(void)accessToken:(OAServiceTicket *)ticket didFailWithError:(NSError *)error
{
}
@end
