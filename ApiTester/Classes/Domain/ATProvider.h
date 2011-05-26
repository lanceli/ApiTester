//
//  ATProvider.h
//  ApiTester
//
//  Created by WU Kai on 5/26/11.
//  Copyright 2011 None. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "OAuthConsumer.h"


@interface ATProvider : NSObject {
    OAConsumer *_consumer;
    OAToken *_accessToken;
}

@property (nonatomic,retain) OAConsumer *consumer;
@property (nonatomic,retain) OAToken *accessToken;

@end
