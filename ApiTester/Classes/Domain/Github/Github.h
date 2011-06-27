//
//  Github.h
//  ApiTester
//
//  Created by WU Kai on 6/26/11.
//  Copyright 2011 None. All rights reserved.
//

#import <Foundation/Foundation.h>


@protocol GHSessionDelegate;
@interface Github : NSObject {
  NSString *_accessToken;
  id<GHSessionDelegate> _sessionDelegate;
  NSString *_clientId;
  NSString *_clientSecret;
}

@property(nonatomic, copy) NSString* accessToken;
@property(nonatomic, assign) id<GHSessionDelegate> sessionDelegate;

- (id)initWithClientId:(NSString *)id
                Secret:(NSString *)secret;

- (void)authorize:(NSArray *)permissions
         delegate:(id<GHSessionDelegate>)delegate;

- (BOOL)handleOpenURL:(NSURL *)url;
@end

/**
 * Your application should implement this delegate to receive session callbacks.
 */
@protocol GHSessionDelegate <NSObject>

@optional

/**
 * Called when the user successfully logged in.
 */
- (void)ghDidLogin;

/**
 * Called when the user dismissed the dialog without logging in.
 */
- (void)ghDidNotLogin:(BOOL)cancelled;

/**
 * Called when the user logged out.
 */
- (void)ghDidLogout;

@end
