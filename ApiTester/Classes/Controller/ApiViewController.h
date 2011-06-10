//
//  ApiViewController.h
//  ApiTester
//
//  Created by WU Kai on 5/30/11.
//  Copyright 2011 None. All rights reserved.
//

#import <UIKit/UIKit.h>


@class Provider;
@interface ApiViewController : UITableViewController {
    Provider *_provider;
    NSMutableArray *_sections;
    NSArray *_filtered;
    UISearchBar *_searchBar;
    UISearchDisplayController *_searchDC;
}

@property (nonatomic,retain) Provider *provider;
@property (nonatomic,retain) NSMutableArray *sections;
@property (nonatomic,retain) NSArray *filtered;
@property (nonatomic,retain) IBOutlet UISearchBar *searchBar;
@property (nonatomic,retain) IBOutlet UISearchDisplayController *searchDC;

@end
