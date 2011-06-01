//
//  ApiViewController.h
//  ApiTester
//
//  Created by WU Kai on 5/30/11.
//  Copyright 2011 None. All rights reserved.
//

#import <UIKit/UIKit.h>


@class ATProvider;
@interface ApiViewController : UITableViewController {
    ATProvider *_provider;
    
}

@property (nonatomic,retain) ATProvider *provider;

@end
