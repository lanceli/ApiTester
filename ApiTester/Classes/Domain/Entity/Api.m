//
//  Api.m
//  ApiTester
//
//  Created by WU Kai on 6/6/11.
//  Copyright (c) 2011 None. All rights reserved.
//

#import "Api.h"


@implementation Api
@dynamic EndPointURL;
@dynamic DescriptionURL;
@dynamic ApiParameterId;
@dynamic ProviderId;

- (void)addApiParameterIdObject:(NSManagedObject *)value {    
    NSSet *changedObjects = [[NSSet alloc] initWithObjects:&value count:1];
    [self willChangeValueForKey:@"ApiParameterId" withSetMutation:NSKeyValueUnionSetMutation usingObjects:changedObjects];
    [[self primitiveValueForKey:@"ApiParameterId"] addObject:value];
    [self didChangeValueForKey:@"ApiParameterId" withSetMutation:NSKeyValueUnionSetMutation usingObjects:changedObjects];
    [changedObjects release];
}

- (void)removeApiParameterIdObject:(NSManagedObject *)value {
    NSSet *changedObjects = [[NSSet alloc] initWithObjects:&value count:1];
    [self willChangeValueForKey:@"ApiParameterId" withSetMutation:NSKeyValueMinusSetMutation usingObjects:changedObjects];
    [[self primitiveValueForKey:@"ApiParameterId"] removeObject:value];
    [self didChangeValueForKey:@"ApiParameterId" withSetMutation:NSKeyValueMinusSetMutation usingObjects:changedObjects];
    [changedObjects release];
}

- (void)addApiParameterId:(NSSet *)value {    
    [self willChangeValueForKey:@"ApiParameterId" withSetMutation:NSKeyValueUnionSetMutation usingObjects:value];
    [[self primitiveValueForKey:@"ApiParameterId"] unionSet:value];
    [self didChangeValueForKey:@"ApiParameterId" withSetMutation:NSKeyValueUnionSetMutation usingObjects:value];
}

- (void)removeApiParameterId:(NSSet *)value {
    [self willChangeValueForKey:@"ApiParameterId" withSetMutation:NSKeyValueMinusSetMutation usingObjects:value];
    [[self primitiveValueForKey:@"ApiParameterId"] minusSet:value];
    [self didChangeValueForKey:@"ApiParameterId" withSetMutation:NSKeyValueMinusSetMutation usingObjects:value];
}



@end
