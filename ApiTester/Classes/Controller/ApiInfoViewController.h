//
//  ApiInfoViewController.h
//  ApiTester
//
//  Created by WU Kai on 6/16/11.
//  Copyright 2011 None. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <iAd/iAd.h>

@class Api;
@interface ApiInfoViewController : UIViewController
<UIWebViewDelegate,ADBannerViewDelegate> {
    Api *_api;
}

@property (nonatomic, retain) IBOutlet UIView *overlay;
@property (nonatomic, retain) IBOutlet UIWebView *webView;
@property (nonatomic, retain) IBOutlet ADBannerView *banner;
@property (nonatomic, retain) IBOutlet UIBarButtonItem *doneButton;
@property (nonatomic, retain) Api *api;

- (IBAction)doneButtonAction;

@end
