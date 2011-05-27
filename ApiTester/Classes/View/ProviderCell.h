//
//  ApiTesterAppDelegate.m
//  ApiTester
//
//  Created by WU Kai on 5/24/11.
//  Copyright 2011 None. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ATProvider;
@interface ProviderCell : UITableViewCell {
    ATProvider *_provider;
  @private
	IBOutlet UILabel *titleLabel;
	IBOutlet UILabel *descriptionLabel;
	IBOutlet UIImageView *logoImageView;
}

@property(nonatomic,retain)ATProvider *provider;

@end
