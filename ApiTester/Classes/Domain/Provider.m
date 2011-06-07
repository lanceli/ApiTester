//
//  Provider.m
//  ApiTester
//
//  Created by WU Kai on 6/7/11.
//  Copyright (c) 2011 None. All rights reserved.
//

#import "Provider.h"
#import "Api.h"


@implementation Provider
@dynamic script;
@dynamic consumerSecret;
@dynamic accessURL;
@dynamic requestURL;
@dynamic consumerKey;
@dynamic logo;
@dynamic title;
@dynamic authorizeURL;
@dynamic apis;

- (void)addApisObject:(Api *)value {    
    NSSet *changedObjects = [[NSSet alloc] initWithObjects:&value count:1];
    [self willChangeValueForKey:@"apis" withSetMutation:NSKeyValueUnionSetMutation usingObjects:changedObjects];
    [[self primitiveValueForKey:@"apis"] addObject:value];
    [self didChangeValueForKey:@"apis" withSetMutation:NSKeyValueUnionSetMutation usingObjects:changedObjects];
    [changedObjects release];
}

- (void)removeApisObject:(Api *)value {
    NSSet *changedObjects = [[NSSet alloc] initWithObjects:&value count:1];
    [self willChangeValueForKey:@"apis" withSetMutation:NSKeyValueMinusSetMutation usingObjects:changedObjects];
    [[self primitiveValueForKey:@"apis"] removeObject:value];
    [self didChangeValueForKey:@"apis" withSetMutation:NSKeyValueMinusSetMutation usingObjects:changedObjects];
    [changedObjects release];
}

- (void)addApis:(NSSet *)value {    
    [self willChangeValueForKey:@"apis" withSetMutation:NSKeyValueUnionSetMutation usingObjects:value];
    [[self primitiveValueForKey:@"apis"] unionSet:value];
    [self didChangeValueForKey:@"apis" withSetMutation:NSKeyValueUnionSetMutation usingObjects:value];
}

- (void)removeApis:(NSSet *)value {
    [self willChangeValueForKey:@"apis" withSetMutation:NSKeyValueMinusSetMutation usingObjects:value];
    [[self primitiveValueForKey:@"apis"] minusSet:value];
    [self didChangeValueForKey:@"apis" withSetMutation:NSKeyValueMinusSetMutation usingObjects:value];
}


@end
