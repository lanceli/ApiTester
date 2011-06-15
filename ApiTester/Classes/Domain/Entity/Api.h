//
//  Api.h
//  ApiTester
//
//  Created by WU Kai on 6/10/11.
//  Copyright (c) 2011 None. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class ApiParameter, Provider;

@interface Api : NSManagedObject {
@private
}
@property (nonatomic, retain) NSString * endPointURL;
@property (nonatomic, retain) NSString * descriptionURL;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * briefing;
@property (nonatomic, retain) NSString * httpMethod;
@property (nonatomic, retain) Provider * provider;
@property (nonatomic, retain) NSSet* apiParameters;

- (NSComparisonResult) compare:(Api *)api;
@end
