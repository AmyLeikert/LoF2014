//
//  ALEvent.h
//  LakesKraken
//
//  Created by DetroitLabsUser on 7/16/14.
//  Copyright (c) 2014 DetroitLabsUser. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface ALEvent : NSObject

@property (nonatomic, strong) NSString *startTime;
@property (nonatomic, strong) NSString *eventDescription;
@property (nonatomic, strong) NSString *endTime;
@property (nonatomic, strong) NSString *location;
@property (nonatomic, strong) NSString *eventName;
@property (nonatomic, strong) NSMutableArray *resultsArray;



@end
