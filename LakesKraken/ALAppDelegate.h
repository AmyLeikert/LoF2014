//
//  ALAppDelegate.h
//  LakesKraken
//
//  Created by DetroitLabsUser on 6/16/14.
//  Copyright (c) 2014 DetroitLabsUser. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ALAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property UINavigationController *navController;
//@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
//@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
//@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;
- (NSManagedObjectContext *)managedObjectContext;
- (NSManagedObjectModel *)managedObjectModel;


@end
