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
@synthesize requestURL=_requestURL;
@synthesize accessURL=_accessURL;
@synthesize authorizeURL=_authorizeURL;

#pragma mark - init

-(id)initWithKey:(NSString *)key
          secret:(NSString *)secret
           title:(NSString *)title
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
    [_requestURL release];
    [_accessURL release];
    [_authorizeURL release];
    [super dealloc];
}


@end
