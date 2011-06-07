//
//  Provider.h
//  ApiTester
//
//  Created by WU Kai on 6/7/11.
//  Copyright (c) 2011 None. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Api;

@interface Provider : NSManagedObject {
@private
}
@property (nonatomic, retain) NSString * script;
@property (nonatomic, retain) NSString * consumerSecret;
@property (nonatomic, retain) NSString * accessURL;
@property (nonatomic, retain) NSString * requestURL;
@property (nonatomic, retain) NSString * consumerKey;
@property (nonatomic, retain) NSString * logo;
@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) NSString * authorizeURL;
@property (nonatomic, retain) NSSet* apis;

@end
