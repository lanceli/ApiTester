//
//  ApiViewController.h
//  ApiTester
//
//  Created by WU Kai on 6/14/11.
//  Copyright 2011 None. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    ApiMandatorySection = 0,
    ApiOptionalSection
} ApiParameterSection;

typedef enum {
    ApiCodeSection = 0,
    ApiHeaderSection
} ApiResultSection;

@class Api,OAServiceTicket;
@interface ApiViewController : UIViewController
    <UITextFieldDelegate,UITableViewDelegate,UITableViewDataSource> {
    Api *_api;
    OAServiceTicket *_ticket;
    NSString *_response;
    NSMutableArray *_parameters;
    UITextField *_activeField;
}
@property (nonatomic,retain) Api *api;
@property (nonatomic,retain) OAServiceTicket *ticket;
@property (nonatomic,copy) NSString *response;
@property (nonatomic,getter=isParameterTable) BOOL parameterTable;
@property (nonatomic,retain) NSMutableArray *parameters;
@property (nonatomic,retain) UITextField *activeField;
@property (nonatomic,retain) IBOutlet UITableViewCell *none;
@property (nonatomic,retain) IBOutlet UIButton *infoButton;
@property (nonatomic,retain) IBOutlet UIButton *parametersButton;
@property (nonatomic,retain) IBOutlet UIButton *resultButton;
@property (nonatomic,retain) IBOutlet UITableView *tableView;

- (IBAction)testButtonAction:(id) sender;
- (IBAction)infoButtonAction:(id) sender;
- (IBAction)parametersButtonAction:(id) sender;
- (IBAction)resultButtonAction:(id) sender;

@end
