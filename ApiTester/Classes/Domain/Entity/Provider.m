//
//  Provider.m
//  ApiTester
//
//  Created by WU Kai on 6/9/11.
//  Copyright (c) 2011 None. All rights reserved.
//

#import "Provider.h"
#import "ATTencentMutableURLRequest.h"
#import "ATLinkedinMutableURLRequest.h"
#import "Api.h"

static NSString *kFacebookTitle  = @"Facebook";
static NSString *kGithubTitle = @"Github";
static NSString *kTencentTitle = @"Tencent Weibo";
static NSString *kLinkedinTitle = @"LinkedIn";

@implementation Provider
@dynamic script;
@dynamic requestURL;
@dynamic title;
@dynamic accessURL;
@dynamic consumerKey;
@dynamic authorizeURL;
@dynamic logo;
@dynamic consumerSecret;
@dynamic accessTokenKey;
@dynamic accessTokenSecret;
@dynamic apis;

- (void)addApisObject:(Api *)value {    
    NSSet *changedObjects = [[NSSet alloc] initWithObjects:&value count:1];
    [self willChangeValueForKey:@"apis" withSetMutation:NSKeyValueUnionSetMutation usingObjects:changedObjects];
    [[self primitiveValueForKey:@"apis"] addObject:value];
    [self didChangeValueForKey:@"apis" withSetMutation:NSKeyValueUnionSetMutation usingObjects:changedObjects];
    [changedObjects release];
}

- (void)removeApisObject:(Api *)value {
    NSSet *changedObjects = [[NSSet alloc] initWithObjects:&value count:1];
    [self willChangeValueForKey:@"apis" withSetMutation:NSKeyValueMinusSetMutation usingObjects:changedObjects];
    [[self primitiveValueForKey:@"apis"] removeObject:value];
    [self didChangeValueForKey:@"apis" withSetMutation:NSKeyValueMinusSetMutation usingObjects:changedObjects];
    [changedObjects release];
}

- (void)addApis:(NSSet *)value {    
    [self willChangeValueForKey:@"apis" withSetMutation:NSKeyValueUnionSetMutation usingObjects:value];
    [[self primitiveValueForKey:@"apis"] unionSet:value];
    [self didChangeValueForKey:@"apis" withSetMutation:NSKeyValueUnionSetMutation usingObjects:value];
}

- (void)removeApis:(NSSet *)value {
    [self willChangeValueForKey:@"apis" withSetMutation:NSKeyValueMinusSetMutation usingObjects:value];
    [[self primitiveValueForKey:@"apis"] minusSet:value];
    [self didChangeValueForKey:@"apis" withSetMutation:NSKeyValueMinusSetMutation usingObjects:value];
}

-(BOOL)isAuthorized
{
    if ([self isFacebook]) {
        if ([self.accessTokenSecret length] == 0) return false;
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        BOOL expired = [[formatter dateFromString:self.accessTokenSecret] compare:[NSDate date]] == NSOrderedAscending;
        if (expired) NSLog(@"facebook authorization has expired");
        [formatter release];
        return !expired;
    }
    else {
        return [self.accessTokenSecret length] > 0;
    }
}

-(void)revoke
{
    self.accessTokenKey = @"";
    self.accessTokenSecret = @"";
}

-(OAMutableURLRequest *)oauthRequest:(NSURL *)url
{
    OAMutableURLRequest *request = nil;
    OAConsumer *consumer = [[OAConsumer alloc] initWithKey:self.consumerKey secret:self.consumerSecret];
    OAToken *accessToken = [[OAToken alloc] initWithKey:self.accessTokenKey secret:self.accessTokenSecret];

    if ([self.title isEqual:kTencentTitle]) {
        request =  [[ATTencentMutableURLRequest alloc] initWithURL:url
                                                          consumer:consumer
                                                             token:accessToken
                                                             realm:nil
                                                 signatureProvider:nil];
    }
    else if ([self.title isEqual:kLinkedinTitle]) {
        request =  [[ATLinkedinMutableURLRequest alloc] initWithURL:url
                                                           consumer:consumer
                                                              token:accessToken
                                                              realm:nil
                                                  signatureProvider:nil];
    }
    else {
        request =  [[OAMutableURLRequest alloc] initWithURL:url
                                                   consumer:consumer
                                                      token:accessToken
                                                      realm:nil
                                          signatureProvider:nil];
    }

    [consumer release];
    [accessToken release];
    return request;
}

-(NSString *)description
{
    NSString *desc = [NSString stringWithFormat:@"title=%@\nlogo=%@\nscript=%@\nrequestURL=%@\nauthorizeURL=%@\naccessURL=%@\nconsumerKey=%@\nconsumerSecret=%@\naccessTokenKey=%@\naccessTokenSecret=%@",
             self.title,
             self.logo,
             self.script,
             self.requestURL,
             self.authorizeURL,
             self.accessURL,
             self.consumerKey,
             self.consumerSecret,
             self.accessTokenKey,
             self.accessTokenSecret];
    return desc;
}

-(NSString *)oauthCallback
{
    return [self.title isEqual:kTencentTitle] ? @"null" : @"oob";
}

-(BOOL)isFacebook
{
    return [self.title isEqual:kFacebookTitle];
}

-(BOOL)isGithub
{
    return [self.title isEqual:kGithubTitle];
}
@end
