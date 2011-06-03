//
//  AuthorizeWebViewController.m
//  ApiTester
//
//  Created by WU Kai on 5/30/11.
//  Copyright 2011 None. All rights reserved.
//

#import "AuthorizeWebViewController.h"
#import "ATProvider.h"
#import "ATModalAlert.h"

@implementation AuthorizeWebViewController

@synthesize overlay;
@synthesize webView;
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
    [overlay release];
    [webView release];
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

#pragma mark -
#pragma mark View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.doneButton.title = @"Authorize";
    [self.overlay removeFromSuperview];
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

- (void)webViewDidStartLoad:(UIWebView *)webView {
    //[[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES]; 
    [self.view addSubview:self.overlay];
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


- (IBAction)cancelButtonAction {
    self.provider.accessToken = nil;
    [self dismissModalViewControllerAnimated:YES];
}

- (IBAction)doneButtonAction {
    NSLog(@"doneButtonAction");
    
    if (NO == [self.provider isAuthorized]) {
        NSLog(@"asking for request token from %@",self.provider.title);
        OAMutableURLRequest *request = [[self.provider oauthRequest:self.provider.requestURL] autorelease];

        OARequestParameter *p0 = [[OARequestParameter alloc] initWithName:@"oauth_callback" 
                                                                    value:self.provider.title == kTencentTitle ? @"null" : @"oob"];
        NSArray *params = [NSArray arrayWithObject:p0];
        [request setParameters:params];

        OADataFetcher *fetcher = [[[OADataFetcher alloc] init] autorelease];
        [fetcher fetchDataWithRequest:request
                             delegate:self
                    didFinishSelector:@selector(requestToken:didFinishWithData:)
                      didFailSelector:@selector(requestToken:didFailWithError:)];
        
        [p0 release];
    }
    else {
        //NSLog(@"PIN html : %@",[self.webView stringByEvaluatingJavaScriptFromString:@"document.body.innerHTML"]);
        NSString *pin = [self.webView stringByEvaluatingJavaScriptFromString:self.provider.script];
        NSLog(@"PIN: %@",pin);
        pin = [ATModalAlert ask:[NSString stringWithFormat:@"Input %@ to finish authorization",pin] withTextPrompt:pin];

        if ([pin length] > 0) {
            NSLog(@"successfully authorize with pin:%@", pin);
            OAMutableURLRequest *request = [[self.provider oauthRequest:self.provider.accessURL] autorelease];
            OARequestParameter *p0 = [[OARequestParameter alloc] initWithName:@"oauth_verifier"
                                                                        value:pin];
            NSArray *params = [NSArray arrayWithObjects: p0, nil];
            [request setParameters:params];
            
            OADataFetcher *fetcher = [[[OADataFetcher alloc] init] autorelease];
            [fetcher fetchDataWithRequest:request
                                 delegate:self
                        didFinishSelector:@selector(accessToken:didFinishWithData:)
                          didFailSelector:@selector(accessToken:didFailWithError:)];
            
            [p0 release];
        }
        else {
            NSLog(@"invalid pin:%@", pin);
            self.provider.accessToken = nil;
        }

        [self dismissModalViewControllerAnimated:YES];
    }
}

#pragma mark -
#pragma mark ATOauthDelegate

-(void)requestToken:(OAServiceTicket *)ticket didFinishWithData:(NSData *)data
{
    if (ticket.didSucceed) {
        NSLog(@"requestToken is granted");
        NSString *responseBody = [[NSString alloc] initWithData:data
                                                       encoding:NSUTF8StringEncoding];
        
        self.provider.accessToken = nil;
        self.provider.accessToken = [[OAToken alloc] initWithHTTPResponseBody:responseBody];
        [responseBody release];
        
        OAMutableURLRequest *request = [[self.provider oauthRequest:self.provider.authorizeURL] autorelease];
        OARequestParameter *p0 = [[OARequestParameter alloc] initWithName:@"oauth_token"
                                                                    value:self.provider.accessToken.key];
        NSArray *params = [NSArray arrayWithObject:p0];
        [request setParameters:params];
        [self.webView loadRequest:request];
        self.doneButton.title = @"Finish authorization with PIN";

        [p0 release];
    }
    else {
        NSLog(@"request ticket is returned but not succeeded");
        [ATModalAlert say:@"Cannot get the oauth request token from %@",self.provider.title];
        self.provider.accessToken = nil;
        [self dismissModalViewControllerAnimated:YES];
    }
}

-(void)requestToken:(OAServiceTicket *)ticket didFailWithError:(NSError *)error
{
    NSLog(@"%@", error);
    [ATModalAlert say:@"Cannot get the oauth request token from %@",self.provider.title];
    self.provider.accessToken = nil;
    [self dismissModalViewControllerAnimated:YES];
}

-(void)accessToken:(OAServiceTicket *)ticket didFinishWithData:(NSData *)data
{
    if (ticket.didSucceed) {
        NSLog(@"accessToken is granted");
        
        NSString *responseBody = [[NSString alloc] initWithData:data
                                                       encoding:NSUTF8StringEncoding];
        self.provider.accessToken = nil;
        self.provider.accessToken = [[OAToken alloc] initWithHTTPResponseBody:responseBody];
        [responseBody release];
        
        [self.provider.accessToken storeInUserDefaultsWithServiceProviderName:kAppProviderName
                                                                       prefix:self.provider.title];
    }
}

-(void)accessToken:(OAServiceTicket *)ticket didFailWithError:(NSError *)error
{
    NSLog(@"%@", error);
    [ATModalAlert say:@"Cannot get the oauth access token from %@",self.provider.title];
    self.provider.accessToken = nil;
}
@end
