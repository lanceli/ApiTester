//
//  AuthorizeWebViewController.m
//  ApiTester
//
//  Created by WU Kai on 5/30/11.
//  Copyright 2011 None. All rights reserved.
//

#import "AuthorizeWebViewController.h"
#import "ATProvider.h"

@implementation AuthorizeWebViewController

@synthesize webView;
@synthesize doneButton;
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
    [webView release];
    [doneButton release];
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

- (void)webViewDidStartLoad:(UIWebView *)webView {
    //[[UIApplication sharedApplication] setStatusBarHidden:NO animated:YES];
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES]; 
}


- (void)webViewDidFinishLoad:(UIWebView *)webView {
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];  
}


- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    NSLog(@"webView:shouldStartLoadWithRequest:");
    NSLog(@"%@", [request.URL absoluteString]);
     
    return YES;
}

- (IBAction)doneButtonAction {
    NSLog(@"doneButtonAction");
    
    NSString *script;
    script = @"(function() { return document.getElementById(\"oauth_pin\").firstChild.textContent; } ())";
    
    NSString *pin = [self.webView stringByEvaluatingJavaScriptFromString:script];
    
    if ([pin length] > 0) {
    }
    else {
    }

    [self dismissModalViewControllerAnimated:YES];
}

-(void)authenticateButtoneAction
{
    NSLog(@"authenticate %@",self.provider.title);
    OAMutableURLRequest *request = [[[OAMutableURLRequest alloc] initWithURL:self.provider.requestURL
                                                                    consumer:self.provider.consumer
                                                                       token:nil
                                                                       realm:nil
                                                           signatureProvider:nil] autorelease];
    [request setHTTPMethod:@"POST"];
    OARequestParameter *p0 = [[OARequestParameter alloc] initWithName:@"oauth_callback" value:@"oob"];
    NSArray *params = [NSArray arrayWithObject:p0];
    [request setParameters:params];

    OADataFetcher *fetcher = [[[OADataFetcher alloc] init] autorelease];
    [fetcher fetchDataWithRequest:request
                         delegate:self
                didFinishSelector:@selector(requestToken:didFinishWithData:)
                  didFailSelector:@selector(requestToken:didFailWithError:)];
    
    [p0 release];
}

#pragma mark - ATOauthDelegate

-(void)requestToken:(OAServiceTicket *)ticket didFinishWithData:(NSData *)data
{
    if (ticket.didSucceed) {
        NSString *responseBody = [[NSString alloc] initWithData:data
                                                       encoding:NSUTF8StringEncoding];
        
        self.provider.accessToken = nil;
        self.provider.accessToken = [[OAToken alloc] initWithHTTPResponseBody:responseBody];
        [responseBody release];
        
        OAMutableURLRequest *request = [[[OAMutableURLRequest alloc] initWithURL:self.provider.authorizeURL
                                                                        consumer:self.provider.consumer
                                                                           token:self.provider.accessToken
                                                                           realm:nil
                                                               signatureProvider:nil] autorelease];
            
        
        OARequestParameter *p0 = [[OARequestParameter alloc] initWithName:@"oauth_token"
                                                                    value:self.provider.accessToken.key];
        NSArray *params = [NSArray arrayWithObject:p0];
        [request setParameters:params];

        [p0 release];
    }
    else {
        
    }
}

-(void)requestToken:(OAServiceTicket *)ticket didFailWithError:(NSError *)error
{
    NSLog(@"%@", error);
}
-(void)accessToken:(OAServiceTicket *)ticket didFinishWithData:(NSData *)data
{
}
-(void)accessToken:(OAServiceTicket *)ticket didFailWithError:(NSError *)error
{
}
@end
