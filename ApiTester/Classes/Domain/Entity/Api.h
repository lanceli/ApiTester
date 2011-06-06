//
//  Api.h
//  ApiTester
//
//  Created by WU Kai on 6/6/11.
//  Copyright (c) 2011 None. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Api : NSManagedObject {
@private
}
@property (nonatomic, retain) NSString * EndPointURL;
@property (nonatomic, retain) NSString * DescriptionURL;
@property (nonatomic, retain) NSSet* ApiParameterId;
@property (nonatomic, retain) NSManagedObject * ProviderId;

@end
