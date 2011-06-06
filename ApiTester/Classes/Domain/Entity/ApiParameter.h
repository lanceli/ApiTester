//
//  ApiParameter.h
//  ApiTester
//
//  Created by WU Kai on 6/6/11.
//  Copyright (c) 2011 None. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Api;

@interface ApiParameter : NSManagedObject {
@private
}
@property (nonatomic, retain) NSString * View;
@property (nonatomic, retain) NSString * Name;
@property (nonatomic, retain) NSString * Value;
@property (nonatomic, retain) NSNumber * Optional;
@property (nonatomic, retain) Api * ApiId;

@end
