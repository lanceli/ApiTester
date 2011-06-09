//
//  AuthorizeGithubViewController.m
//  ApiTester
//
//  Created by WU Kai on 6/3/11.
//  Copyright 2011 None. All rights reserved.
//

#import "AuthorizeGithubViewController.h"
#import "Provider.h"
#import "ATModalAlert.h"

@implementation AuthorizeGithubViewController

@synthesize userName;
@synthesize apiToken;
@synthesize doneButton;
@synthesize cancelButton;
@synthesize provider=_provider;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)dealloc
{
    [userName release];
    [apiToken release];
    [doneButton release];
    [cancelButton release];
    [_provider release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    if (YES == [self.provider isAuthorized]) {
        self.userName.text = self.provider.accessTokenKey;
        self.apiToken.text = self.provider.accessTokenSecret;
        self.doneButton.title = @"Revoke";
    }
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)cancelButtonAction
{
    [self dismissModalViewControllerAnimated:YES];
}

- (IBAction)doneButtonAction
{
    if (NO == [self.provider isAuthorized]) {
        NSLog(@"authorizeButtonAction");
        if ([self.userName.text length] > 0 && [self.apiToken.text length] > 0) {
            [self.provider revoke];
            self.provider.accessTokenKey= self.userName.text;
            self.provider.accessTokenSecret= self.apiToken.text;
            [self dismissModalViewControllerAnimated:YES];
        }
        else {
            [ATModalAlert say:@"Invalid Username or API Token for %@",self.provider.title];
        }
    }
    else {
        NSLog(@"revokeButtonAction");
        [self.provider revoke];
        self.userName.text = @"";
        self.apiToken.text = @"";
        self.doneButton.title = @"Authorize";
    }
}

@end
