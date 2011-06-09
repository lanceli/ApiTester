//
//  ApiTesterAppDelegate.h
//  ApiTester
//
//  Created by WU Kai on 5/24/11.
//  Copyright 2011 None. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FBConnect.h"

#define kFacebookAppId @"156029251129430"

@interface ApiTesterAppDelegate : NSObject <UIApplicationDelegate,FBSessionDelegate> {
    Facebook *_facebook;

}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UINavigationController *navigationController;
@property (nonatomic, retain) Facebook *facebook;

@property (nonatomic, retain, readonly) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, retain, readonly) NSManagedObjectModel *managedObjectModel;
@property (nonatomic, retain, readonly) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;
- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url;
- (void)createEditableCopyOfDatabaseIfNeeded;

@end
