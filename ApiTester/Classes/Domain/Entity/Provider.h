//
//  Provider.h
//  ApiTester
//
//  Created by WU Kai on 6/6/11.
//  Copyright (c) 2011 None. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Api;

@interface Provider : NSManagedObject {
@private
}
@property (nonatomic, retain) NSString * Script;
@property (nonatomic, retain) NSString * ConsumerSecret;
@property (nonatomic, retain) NSString * AccessURL;
@property (nonatomic, retain) NSString * RequestURL;
@property (nonatomic, retain) NSString * ConsumerKey;
@property (nonatomic, retain) NSString * Title;
@property (nonatomic, retain) NSString * AuthorizeURL;
@property (nonatomic, retain) NSString * Logo;
@property (nonatomic, retain) NSSet* ApiId;

@end
