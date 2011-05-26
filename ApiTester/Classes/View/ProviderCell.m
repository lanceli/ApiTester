//
//  ApiTesterAppDelegate.m
//  ApiTester
//
//  Created by WU Kai on 5/24/11.
//  Copyright 2011 None. All rights reserved.
//
#import "ProviderCell.h"

@implementation ProviderCell

- (void)dealloc {
	[titleLabel release];
	[descriptionLabel release];
	[logoImageView release];
    [super dealloc];
}

@end
