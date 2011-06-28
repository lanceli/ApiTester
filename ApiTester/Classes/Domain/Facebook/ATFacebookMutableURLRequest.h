//
//  ATFacebookMutableURLRequest.h
//  ApiTester
//
//  Created by WU Kai on 6/28/11.
//  Copyright 2011 None. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "OAuthConsumer.h"


@interface ATFacebookMutableURLRequest : OAMutableURLRequest {
    
}
- (void)setParameters:(NSArray *)parameters;
- (void)prepare;

@end
