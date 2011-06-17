//
//  ApiResultViewController.m
//  ApiTester
//
//  Created by WU Kai on 6/17/11.
//  Copyright 2011 None. All rights reserved.
//

#import "ApiResultViewController.h"
#import "Api.h"
#import "Json.h"

@implementation ApiResultViewController

@synthesize api=_api,text=_text;
@synthesize textView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        _parser = [[SBJsonParser alloc] init];
        _writer = [[SBJsonWriter alloc] init];
        _writer.humanReadable = YES;
        _writer.sortKeys = YES;
    }
    return self;
}

- (void)dealloc
{
    [_parser release];
    [_writer release];
    [_api release];
    [_text release];
    [textView release];
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
    // self.title = self.api.name;
    self.textView.text = [_writer stringWithObject:[_parser objectWithString:self.text]];
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

@end
