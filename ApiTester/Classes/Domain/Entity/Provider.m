//
//  Provider.m
//  ApiTester
//
//  Created by WU Kai on 6/6/11.
//  Copyright (c) 2011 None. All rights reserved.
//

#import "Provider.h"
#import "Api.h"


@implementation Provider
@dynamic Script;
@dynamic ConsumerSecret;
@dynamic AccessURL;
@dynamic RequestURL;
@dynamic ConsumerKey;
@dynamic Title;
@dynamic AuthorizeURL;
@dynamic Logo;
@dynamic ApiId;

- (void)addApiIdObject:(Api *)value {    
    NSSet *changedObjects = [[NSSet alloc] initWithObjects:&value count:1];
    [self willChangeValueForKey:@"ApiId" withSetMutation:NSKeyValueUnionSetMutation usingObjects:changedObjects];
    [[self primitiveValueForKey:@"ApiId"] addObject:value];
    [self didChangeValueForKey:@"ApiId" withSetMutation:NSKeyValueUnionSetMutation usingObjects:changedObjects];
    [changedObjects release];
}

- (void)removeApiIdObject:(Api *)value {
    NSSet *changedObjects = [[NSSet alloc] initWithObjects:&value count:1];
    [self willChangeValueForKey:@"ApiId" withSetMutation:NSKeyValueMinusSetMutation usingObjects:changedObjects];
    [[self primitiveValueForKey:@"ApiId"] removeObject:value];
    [self didChangeValueForKey:@"ApiId" withSetMutation:NSKeyValueMinusSetMutation usingObjects:changedObjects];
    [changedObjects release];
}

- (void)addApiId:(NSSet *)value {    
    [self willChangeValueForKey:@"ApiId" withSetMutation:NSKeyValueUnionSetMutation usingObjects:value];
    [[self primitiveValueForKey:@"ApiId"] unionSet:value];
    [self didChangeValueForKey:@"ApiId" withSetMutation:NSKeyValueUnionSetMutation usingObjects:value];
}

- (void)removeApiId:(NSSet *)value {
    [self willChangeValueForKey:@"ApiId" withSetMutation:NSKeyValueMinusSetMutation usingObjects:value];
    [[self primitiveValueForKey:@"ApiId"] minusSet:value];
    [self didChangeValueForKey:@"ApiId" withSetMutation:NSKeyValueMinusSetMutation usingObjects:value];
}


@end
