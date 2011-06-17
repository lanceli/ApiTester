//
//  ApiResultViewController.h
//  ApiTester
//
//  Created by WU Kai on 6/17/11.
//  Copyright 2011 None. All rights reserved.
//

#import <UIKit/UIKit.h>


@class Api,SBJsonParser,SBJsonWriter;
@interface ApiResultViewController : UIViewController {
    Api *_api;
    NSString *_text;
    SBJsonParser *_parser;
    SBJsonWriter *_writer;
}
@property (nonatomic,retain) Api *api;
@property (nonatomic,copy) NSString *text;
@property (nonatomic,retain) IBOutlet UITextView *textView;

@end
