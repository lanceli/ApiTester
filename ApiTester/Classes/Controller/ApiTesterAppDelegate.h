//
//  ApiTesterAppDelegate.h
//  ApiTester
//
//  Created by WU Kai on 5/24/11.
//  Copyright 2011 None. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ProviderViewController;
@interface ApiTesterAppDelegate : NSObject <UIApplicationDelegate> {

}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet ProviderViewController *viewController;

@property (nonatomic, retain, readonly) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, retain, readonly) NSManagedObjectModel *managedObjectModel;
@property (nonatomic, retain, readonly) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

@end
