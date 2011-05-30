//
//  AuthorizeWebViewController.h
//  ApiTester
//
//  Created by WU Kai on 5/30/11.
//  Copyright 2011 None. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OAuthConsumer.h"

@protocol ATOauthDelegate <NSObject>
-(void)requestToken:(OAServiceTicket *)ticket didFinishWithData:(NSData *)data;
-(void)requestToken:(OAServiceTicket *)ticket didFailWithError:(NSError *)error;
-(void)accessToken:(OAServiceTicket *)ticket didFinishWithData:(NSData *)data;
-(void)accessToken:(OAServiceTicket *)ticket didFailWithError:(NSError *)error;
@end

@class ATProvider;
@interface AuthorizeWebViewController : UIViewController
<UIWebViewDelegate,ATOauthDelegate>
{
    ATProvider *_provider;
}
@property (nonatomic, retain) IBOutlet UIWebView *webView;
@property (nonatomic, retain) IBOutlet UIBarButtonItem *doneButton;
@property (nonatomic, retain) ATProvider *provider;

- (IBAction)doneButtonAction;
@end
