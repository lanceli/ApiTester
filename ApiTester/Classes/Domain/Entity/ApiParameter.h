//
//  ApiParameter.h
//  ApiTester
//
//  Created by WU Kai on 6/7/11.
//  Copyright (c) 2011 None. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Api;

@interface ApiParameter : NSManagedObject {
@private
}
@property (nonatomic, retain) NSString * viewClass;
@property (nonatomic, retain) NSString * parameterName;
@property (nonatomic, retain) NSString * parameterValue;
@property (nonatomic, retain) NSNumber * optional;
@property (nonatomic, retain) Api * api;

@end
