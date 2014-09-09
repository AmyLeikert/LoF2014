//
//  ALParseQuery.m
//  LakesKraken
//
//  Created by DetroitLabsUser on 7/21/14.
//  Copyright (c) 2014 DetroitLabsUser. All rights reserved.
//

#import "ALParseQuery.h"
#import "ALSearchResultsViewController.h"

@interface ALParseQuery ()
@property ALSearchResultsViewController *searchView;

@end


@implementation ALParseQuery


- (void)fetchDataFromParse:(ALFilterEvent *)filterEvent withResultBlock:(ALParseQueryResultBlock)resultBlock {

    
    PFQuery *query = [PFQuery queryWithClassName:@"schedule"];
    
    if (filterEvent.allDay == NO && [filterEvent.PMPickerValue isEqual: @"PM"] && filterEvent.freeFood == YES) {
        [query whereKey:@"Days" containsString: filterEvent.dayPickerValue];
        [query whereKey:@"hoursPM" containsString:filterEvent.timePickerValue];
        [query whereKey:@"food" equalTo:@YES];
    };
    if (filterEvent.allDay == NO && [filterEvent.PMPickerValue isEqual: @"AM"]&& filterEvent.freeFood == YES) {
        [query whereKey:@"food" equalTo:@YES];
        [query whereKey:@"Days" containsString:filterEvent.dayPickerValue];
        [query whereKey:@"hoursAM" containsString:filterEvent.timePickerValue];
    };
    
     if (filterEvent.allDay == NO && [filterEvent.PMPickerValue isEqual: @"AM"]&& filterEvent.freeFood == NO) {
        [query whereKey:@"Days" containsString:filterEvent.dayPickerValue];
        [query whereKey:@"hoursAM" containsString:filterEvent.timePickerValue];
    }
    
    else if (filterEvent.allDay == NO && [filterEvent.PMPickerValue isEqual: @"PM"]&& filterEvent.freeFood == NO) {
        [query whereKey:@"Days" containsString:filterEvent.dayPickerValue];
        [query whereKey:@"hoursPM" containsString:filterEvent.timePickerValue];
    }
    
    else if (filterEvent.allDay == YES && filterEvent.freeFood == YES) {
        [query whereKey:@"Days" containsString:filterEvent.dayPickerValue];
        [query whereKey:@"allDay" equalTo:@YES];
        [query whereKey:@"food" equalTo:@YES];
    }
    
    else if (filterEvent.allDay == YES) {
        [query whereKey:@"Days" containsString:filterEvent.dayPickerValue];
    };
    
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            NSMutableArray *events = [NSMutableArray array];
            for (PFObject *object in objects) {
                ALEvent *event = [[ALEvent alloc]init];
                event.eventDescription = object[@"description"];
                event.startTime = object[@"startTime"];
                event.siteLocation = object[@"location"];
                event.endTime = object[@"endTime"];
                event.eventName = object[@"eventName"];
                event.days = object[@"daysString"];
                event.freeFood = [object[@"food"] boolValue];
                [events addObject:event];
            }
            resultBlock([events copy], error);
        }
    }];
}

@end
