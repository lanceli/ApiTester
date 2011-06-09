//
//  AuthorizeGithubViewController.h
//  ApiTester
//
//  Created by WU Kai on 6/3/11.
//  Copyright 2011 None. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Provider;
@interface AuthorizeGithubViewController : UIViewController {
    Provider *_provider;
}
@property (nonatomic, retain) IBOutlet UIBarButtonItem *doneButton;
@property (nonatomic, retain) IBOutlet UIBarButtonItem *cancelButton;
@property (nonatomic, retain) IBOutlet UITextField *userName;
@property (nonatomic, retain) IBOutlet UITextField *apiToken;
@property (nonatomic, retain) Provider *provider;

- (IBAction)doneButtonAction;
- (IBAction)cancelButtonAction;

@end
