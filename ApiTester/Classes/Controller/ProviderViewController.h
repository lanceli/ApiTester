//
//  ProviderViewController.h
//  ApiTester
//
//  Created by WU Kai on 5/26/11.
//  Copyright 2011 None. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FBConnect.h"

@interface ProviderViewController : UITableViewController<FBSessionDelegate> {
    NSArray *_providers;
    NSIndexPath *_reloadCell;
}

@property (nonatomic,retain) NSArray *providers;
@property (nonatomic,retain) NSIndexPath *reloadCell;

- (IBAction)infoButtonAction;

@end
