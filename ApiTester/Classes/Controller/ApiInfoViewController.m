//
//  ApiInfoViewController.m
//  ApiTester
//
//  Created by WU Kai on 6/16/11.
//  Copyright 2011 None. All rights reserved.
//

#import "ApiInfoViewController.h"
#import "Api.h"

@implementation ApiInfoViewController

@synthesize overlay,webView,banner,doneButton;
@synthesize api=_api;

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
    [overlay release];
    [webView release];
    [banner release];
    [doneButton release];
    [_api release];
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
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [(UIActivityIndicatorView *)[self.overlay viewWithTag:101] setHidden:YES];
    self.banner.delegate = self;

    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:self.api.descriptionURL]];
    [self.webView loadRequest:request];
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

- (IBAction)doneButtonAction
{
    [self dismissModalViewControllerAnimated:YES];
}

#pragma mark UIWebViewDelegate methods

- (void)webViewDidStartLoad:(UIWebView *)webView {
    //[[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES]; 
    [(UIActivityIndicatorView *)[self.overlay viewWithTag:101] setHidden:NO];
    [(UIActivityIndicatorView *)[self.overlay viewWithTag:101] startAnimating];
}


- (void)webViewDidFinishLoad:(UIWebView *)webView {
    //[[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];  
    [(UIActivityIndicatorView *)[self.overlay viewWithTag:101] stopAnimating];
    [self.overlay removeFromSuperview];
}


- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    NSLog(@"webView:shouldStartLoadWithRequest: %@",[request.URL absoluteString]);
    return YES;
}

#pragma mark ADBannerViewDelegate methods

-(void)bannerViewDidLoadAd:(ADBannerView *)banner
{
}

-(void)bannerView:(ADBannerView *)banner didFailToReceiveAdWithError:(NSError *)error
{
}

-(BOOL)bannerViewActionShouldBegin:(ADBannerView *)banner willLeaveApplication:(BOOL)willLeave
{
    return YES;
}

-(void)bannerViewActionDidFinish:(ADBannerView *)banner
{
}

@end
