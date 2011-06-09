//
//  ApiTesterAppDelegate.m
//  ApiTester
//
//  Created by WU Kai on 5/24/11.
//  Copyright 2011 None. All rights reserved.
//

#import "ApiTesterAppDelegate.h"
#import "ProviderViewController.h"

@implementation ApiTesterAppDelegate


@synthesize window=_window;
@synthesize navigationController=_navigationController;
@synthesize managedObjectContext=__managedObjectContext;
@synthesize managedObjectModel=__managedObjectModel;
@synthesize persistentStoreCoordinator=__persistentStoreCoordinator;
@synthesize facebook=_facebook;

- (void)initCoreData
{
    NSManagedObjectContext *context = [self managedObjectContext];
    NSManagedObject *weibo = [NSEntityDescription insertNewObjectForEntityForName:@"Provider"
                                                           inManagedObjectContext:context];

    [weibo setValue:@"111" forKey:@"consumerKey"];
    [weibo setValue:@"222" forKey:@"consumerSecret"];
    [weibo setValue:@"sina" forKey:@"logo"];
    [weibo setValue:@"weibo" forKey:@"title"];
    [weibo setValue:@"request" forKey:@"requestURL"];
    [weibo setValue:@"access" forKey:@"accessURL"];
    [weibo setValue:@"authorize" forKey:@"authorizeURL"];
    [weibo setValue:@"document" forKey:@"script"];
    [weibo setValue:@"" forKey:@"accessTokenKey"];
    [weibo setValue:@"" forKey:@"accessTokenSecret"];

    NSManagedObject *publicLine = [NSEntityDescription insertNewObjectForEntityForName:@"Api"
                                                                inManagedObjectContext:context];

    [publicLine setValue:@"http://open.weibo.com/wiki/index.php/Statuses/public_timeline" forKey:@"descriptionURL"];
    [publicLine setValue:@"http://api.t.sina.com.cn/statuses/public_timeline" forKey:@"endPointURL"];

    NSManagedObject *source = [NSEntityDescription insertNewObjectForEntityForName:@"ApiParameter"
                                                            inManagedObjectContext:context];
    [source setValue:[NSNumber numberWithBool:YES] forKey:@"optional"];
    [source setValue:@"source" forKey:@"parameterName"];
    [source setValue:@"source" forKey:@"parameterValue"];
    [source setValue:@"UITextField" forKey:@"viewClass"];

    NSManagedObject *count = [NSEntityDescription insertNewObjectForEntityForName:@"ApiParameter"
                                                           inManagedObjectContext:context];
    [count setValue:[NSNumber numberWithBool:YES] forKey:@"optional"];
    [count setValue:@"count" forKey:@"parameterName"];
    [count setValue:@"20" forKey:@"parameterValue"];
    [count setValue:@"UITextField" forKey:@"viewClass"];

    NSManagedObject *baseApp = [NSEntityDescription insertNewObjectForEntityForName:@"ApiParameter"
                                                             inManagedObjectContext:context];
    [baseApp setValue:[NSNumber numberWithBool:YES] forKey:@"optional"];
    [baseApp setValue:@"base_app" forKey:@"parameterName"];
    [baseApp setValue:@"0" forKey:@"parameterValue"];
    [baseApp setValue:@"UISwitch" forKey:@"viewClass"];

    [weibo setValue:[NSSet setWithObject:publicLine] forKey:@"apis"];
    [publicLine setValue:weibo forKey:@"provider"];

    [source setValue:publicLine forKey:@"api"];
    [count setValue:publicLine forKey:@"api"];
    [baseApp setValue:publicLine forKey:@"api"];
    [publicLine setValue:[NSSet setWithObjects:source,count,baseApp,nil] forKey:@"apiParameters"];

    [self saveContext];
}


- (void)createEditableCopyOfDatabaseIfNeeded
{
	// First, test for existence - we don't want to wipe out a user's DB
	NSFileManager *fileManager = [NSFileManager defaultManager];
	NSURL *documentDirectory = [self applicationDocumentsDirectory];
	NSString *writableDBPath = [[documentDirectory path] stringByAppendingPathComponent:@"ApiTester.sqlite"];
	
	BOOL dbexits = [fileManager fileExistsAtPath:writableDBPath];
	if (!dbexits) {
		// The writable database does not exist, so copy the default to the appropriate location.
		NSString *defaultDBPath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"ApiTester.sqlite"];
		
		NSError *error;
		BOOL success = [fileManager copyItemAtPath:defaultDBPath toPath:writableDBPath error:&error];
		if (!success) {
			NSAssert1(0, @"Failed to create writable database file with message '%@'.", [error localizedDescription]);
		}
	}
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    _facebook = [[Facebook alloc] initWithAppId:kFacebookAppId];
    //[self initCoreData];
    [self createEditableCopyOfDatabaseIfNeeded];
    [self.window addSubview:self.navigationController.view];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
     */
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    /*
     Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
     */
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Saves changes in the application's managed object context before the application terminates.
    [self saveContext];
}

- (void)dealloc
{
    [_window release];
    [_navigationController release];
    [__managedObjectContext release];
    [__managedObjectModel release];
    [__persistentStoreCoordinator release];
    [super dealloc];
}

- (void)awakeFromNib
{
    /*
     Typically you should set up the Core Data stack here, usually by passing the managed object context to the first view controller.
     self.<#View controller#>.managedObjectContext = self.managedObjectContext;
    */
}

- (void)saveContext
{
    NSError *error = nil;
    NSManagedObjectContext *managedObjectContext = self.managedObjectContext;
    if (managedObjectContext != nil)
    {
        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error])
        {
            /*
             Replace this implementation with code to handle the error appropriately.
             
             abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development. If it is not possible to recover from the error, display an alert panel that instructs the user to quit the application by pressing the Home button.
             */
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        } 
    }
}

#pragma mark -
#pragma mark Core Data stack

/**
 Returns the managed object context for the application.
 If the context doesn't already exist, it is created and bound to the persistent store coordinator for the application.
 */
- (NSManagedObjectContext *)managedObjectContext
{
    if (__managedObjectContext != nil)
    {
        return __managedObjectContext;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (coordinator != nil)
    {
        __managedObjectContext = [[NSManagedObjectContext alloc] init];
        [__managedObjectContext setPersistentStoreCoordinator:coordinator];
    }
    return __managedObjectContext;
}

/**
 Returns the managed object model for the application.
 If the model doesn't already exist, it is created from the application's model.
 */
- (NSManagedObjectModel *)managedObjectModel
{
    if (__managedObjectModel != nil)
    {
        return __managedObjectModel;
    }
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"ApiTester" withExtension:@"momd"];
    __managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];    
    return __managedObjectModel;
}

/**
 Returns the persistent store coordinator for the application.
 If the coordinator doesn't already exist, it is created and the application's store added to it.
 */
- (NSPersistentStoreCoordinator *)persistentStoreCoordinator
{
    if (__persistentStoreCoordinator != nil)
    {
        return __persistentStoreCoordinator;
    }
    
    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"ApiTester.sqlite"];
    
    NSError *error = nil;
    __persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    if (![__persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error])
    {
        /*
         Replace this implementation with code to handle the error appropriately.
         
         abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development. If it is not possible to recover from the error, display an alert panel that instructs the user to quit the application by pressing the Home button.
         
         Typical reasons for an error here include:
         * The persistent store is not accessible;
         * The schema for the persistent store is incompatible with current managed object model.
         Check the error message to determine what the actual problem was.
         
         
         If the persistent store is not accessible, there is typically something wrong with the file path. Often, a file URL is pointing into the application's resources directory instead of a writeable directory.
         
         If you encounter schema incompatibility errors during development, you can reduce their frequency by:
         * Simply deleting the existing store:
         [[NSFileManager defaultManager] removeItemAtURL:storeURL error:nil]
         
         * Performing automatic lightweight migration by passing the following dictionary as the options parameter: 
         [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithBool:YES], NSMigratePersistentStoresAutomaticallyOption, [NSNumber numberWithBool:YES], NSInferMappingModelAutomaticallyOption, nil];
         
         Lightweight migration will only work for a limited set of schema changes; consult "Core Data Model Versioning and Data Migration Programming Guide" for details.
         
         */
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }    
    
    return __persistentStoreCoordinator;
}

#pragma mark -
#pragma mark Application's Documents directory

/**
 Returns the URL to the application's Documents directory.
 */
- (NSURL *)applicationDocumentsDirectory
{
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url
{
    return [_facebook handleOpenURL:url];
}

#pragma mark -
#pragma mark FBSessionDelegate

/**
 * Your application should implement this delegate to receive session callbacks.
 */
- (void)fbDidLogin
{
}

/**
 * Called when the user dismissed the dialog without logging in.
 */
- (void)fbDidNotLogin:(BOOL)cancelled
{
}

/**
 * Called when the user logged out.
 */
- (void)fbDidLogout
{
}

@end
