//
//  Api.m
//  ApiTester
//
//  Created by WU Kai on 6/7/11.
//  Copyright (c) 2011 None. All rights reserved.
//

#import "Api.h"
#import "ApiParameter.h"
#import "Provider.h"


@implementation Api
@dynamic endPointURL;
@dynamic descriptionURL;
@dynamic apiParameters;
@dynamic provider;

- (void)addApiParametersObject:(ApiParameter *)value {    
    NSSet *changedObjects = [[NSSet alloc] initWithObjects:&value count:1];
    [self willChangeValueForKey:@"apiParameters" withSetMutation:NSKeyValueUnionSetMutation usingObjects:changedObjects];
    [[self primitiveValueForKey:@"apiParameters"] addObject:value];
    [self didChangeValueForKey:@"apiParameters" withSetMutation:NSKeyValueUnionSetMutation usingObjects:changedObjects];
    [changedObjects release];
}

- (void)removeApiParametersObject:(ApiParameter *)value {
    NSSet *changedObjects = [[NSSet alloc] initWithObjects:&value count:1];
    [self willChangeValueForKey:@"apiParameters" withSetMutation:NSKeyValueMinusSetMutation usingObjects:changedObjects];
    [[self primitiveValueForKey:@"apiParameters"] removeObject:value];
    [self didChangeValueForKey:@"apiParameters" withSetMutation:NSKeyValueMinusSetMutation usingObjects:changedObjects];
    [changedObjects release];
}

- (void)addApiParameters:(NSSet *)value {    
    [self willChangeValueForKey:@"apiParameters" withSetMutation:NSKeyValueUnionSetMutation usingObjects:value];
    [[self primitiveValueForKey:@"apiParameters"] unionSet:value];
    [self didChangeValueForKey:@"apiParameters" withSetMutation:NSKeyValueUnionSetMutation usingObjects:value];
}

- (void)removeApiParameters:(NSSet *)value {
    [self willChangeValueForKey:@"apiParameters" withSetMutation:NSKeyValueMinusSetMutation usingObjects:value];
    [[self primitiveValueForKey:@"apiParameters"] minusSet:value];
    [self didChangeValueForKey:@"apiParameters" withSetMutation:NSKeyValueMinusSetMutation usingObjects:value];
}



@end
