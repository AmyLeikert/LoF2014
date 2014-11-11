//
//  ALPrePopulate.h
//  LakesKraken
//
//  Created by Leikert, Amy on 11/6/14.
//  Copyright (c) 2014 DetroitLabsUser. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ALPrePopulate : NSObject
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;
-(void)prepopulate;
@end
