//
//  ATApi.h
//  ApiTester
//
//  Created by WU Kai on 6/6/11.
//  Copyright 2011 None. All rights reserved.
//

#import <Foundation/Foundation.h>


@class ATProvider;
@interface ATApi : NSObject {
    NSURL *_description;
    NSURL *_endPoint;
    ATProvider *_provider;
    NSArray *_parameters;
}

@property (nonatomic,retain) NSURL *description;
@property (nonatomic,retain) NSURL *endPoint;
@property (nonatomic,retain) ATProvider *provider;
@property (nonatomic,retain) NSArray *parameters;

-(void)call;

@end
