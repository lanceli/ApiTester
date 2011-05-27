//
//  ApiTesterAppDelegate.m
//  ApiTester
//
//  Created by WU Kai on 5/24/11.
//  Copyright 2011 None. All rights reserved.
//
#import "ProviderCell.h"
#import "ATProvider.h"

@implementation ProviderCell

@synthesize provider=_provider;

- (void)dealloc {
	[titleLabel release];
	[descriptionLabel release];
	[logoImageView release];
    [super dealloc];
}

- (void)setProvider:(ATProvider *)provider
{
    [self.provider release];
    _provider = [provider retain];
    titleLabel.text = provider.title;
}
@end
