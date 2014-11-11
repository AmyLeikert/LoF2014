//
//  ALPrePopulate.m
//  LakesKraken
//
//  Created by Leikert, Amy on 11/6/14.
//  Copyright (c) 2014 DetroitLabsUser. All rights reserved.
//

#import "ALPrePopulate.h"
@interface ALPrePopulate ()

@end

@implementation ALPrePopulate

+ (id)sharedManager {
    static ALPrePopulate *sharedMyManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedMyManager = [[self alloc] init];
    });
    return sharedMyManager;
}


-(void)prepopulate {
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Entity" inManagedObjectContext:self.managedObjectContext];
    
    // Initialize Record
    NSManagedObject *record = [[NSManagedObject alloc] initWithEntity:entity insertIntoManagedObjectContext:self.managedObjectContext];
    
    NSArray *array = @[@"2", @"3", @"4"];
    
    for (NSString *string in array) {
        
        NSManagedObject *thing = [[NSManagedObject alloc] initWithEntity:entity insertIntoManagedObjectContext:self.managedObjectContext];
        
        [thing setValue:string forKey:@"name"];
    }
}
@end
