//
//  ProviderViewController.h
//  ApiTester
//
//  Created by WU Kai on 5/26/11.
//  Copyright 2011 None. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface ProviderViewController : UITableViewController {
    NSArray *_providers;
}

@property (nonatomic,retain) NSArray *providers;

@end
