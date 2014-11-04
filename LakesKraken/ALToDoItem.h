//
//  ALToDoItem.h
//  LakesKraken
//
//  Created by DetroitLabsUser on 9/17/14.
//  Copyright (c) 2014 DetroitLabsUser. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ALToDoItem : NSObject

@property NSString *itemName;
@property BOOL completed;
@property (readonly) NSDate *creationDate;

@end
