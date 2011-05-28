//
//  ATProvider.h
//  ApiTester
//
//  Created by WU Kai on 5/26/11.
//  Copyright 2011 None. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "OAuthConsumer.h"

#define kAppProviderName @"iPhoneApiTester"
#define kAppPrefix @"iPhoneApiTester"


@interface ATProvider : NSObject {
    OAConsumer *_consumer;
    OAToken *_accessToken;
    NSString *_title;
    UIImage *_logo;
    NSURL *_requestURL;
    NSURL *_accessURL;
    NSURL *_authorizeURL;
}

@property (nonatomic,retain) OAConsumer *consumer;
@property (nonatomic,retain) OAToken *accessToken;
@property (nonatomic,copy) NSString *title;
@property (nonatomic,retain) UIImage *logo;
@property (nonatomic,retain) NSURL *requestURL;
@property (nonatomic,retain) NSURL *accessURL;
@property (nonatomic,retain) NSURL *authorizeURL;

-(id)initWithKey:(NSString *)key
          secret:(NSString *)secret
           title:(NSString *)title
            logo:(UIImage *)logo
      requestURL:(NSURL *)requestURL
       accessURL:(NSURL *)accessURL
    authorizeURL:(NSURL *)authorizeURL;

@end
