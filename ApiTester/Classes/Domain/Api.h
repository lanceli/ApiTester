//
//  Api.h
//  ApiTester
//
//  Created by WU Kai on 6/7/11.
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
@property (nonatomic, retain) NSSet* apiParameters;
@property (nonatomic, retain) Provider * provider;

@end
