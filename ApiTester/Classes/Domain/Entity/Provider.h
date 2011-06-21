//
//  Provider.h
//  ApiTester
//
//  Created by WU Kai on 6/9/11.
//  Copyright (c) 2011 None. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "OAuthConsumer.h"

@class Provider;
@protocol ProviderPropertyProtocol <NSObject>
-(void)setProvider:(Provider *)provider;
@end

@interface Provider : NSManagedObject {
@private
}
@property (nonatomic, retain) NSString * script;
@property (nonatomic, retain) NSString * requestURL;
@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) NSString * accessURL;
@property (nonatomic, retain) NSString * consumerKey;
@property (nonatomic, retain) NSString * authorizeURL;
@property (nonatomic, retain) NSString * logo;
@property (nonatomic, retain) NSString * consumerSecret;
@property (nonatomic, retain) NSString * accessTokenKey;
@property (nonatomic, retain) NSString * accessTokenSecret;
@property (nonatomic, retain) NSSet* apis;

-(BOOL)isAuthorized;
-(void)revoke;
-(OAMutableURLRequest *)oauthRequest:(NSURL *)url;
-(NSString *)description;
-(NSString *)oauthCallback;

-(BOOL)isFacebook;
-(BOOL)isGithub;

@end
