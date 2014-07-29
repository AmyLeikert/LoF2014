//
//  ALFilterEvent.h
//  LakesKraken
//
//  Created by DetroitLabsUser on 7/21/14.
//  Copyright (c) 2014 DetroitLabsUser. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ALFilterEvent : NSObject
@property BOOL allDay;
@property BOOL freeFood;
@property NSString *dayPickerValue;
@property NSString *timePickerValue;
@property NSString *PMPickerValue;
@property NSMutableArray *resultsArray;

@end
