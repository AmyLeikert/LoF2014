//
//  ALParseQuery.m
//  LakesKraken
//
//  Created by DetroitLabsUser on 7/21/14.
//  Copyright (c) 2014 DetroitLabsUser. All rights reserved.
//

#import "ALParseQuery.h"


@implementation ALParseQuery

-(NSArray*)parseTesting:(ALFilterEvent *)filterEvent {
    
    NSMutableArray *parseArray = [[NSMutableArray alloc]init];
    ALEvent *event = [[ALEvent alloc]init];
    event.eventDescription = @"Coffee Time!";
    event.startTime = @"1:00pm";
    [parseArray addObject:event];
    return [parseArray copy];
//    PFQuery *query = [PFQuery queryWithClassName:@"schedule"];
//    // [query whereKey:@"hoursAM" containedIn:@[@"10"]];
//    if (self.filterEvent.allDay == YES) {
//    [query whereKey:@"allDay" equalTo:@NO];
//    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
//        if (!error) {
//            NSMutableArray *parseArray;
//            // Do something with the found objects
//            for (PFObject *object in objects) {
//                self.event1.eventDescription = object[@"description"];
//                self.event1.startTime = object[@"startTime"];
//                
//            }
//        } else {
//            // Log details of the failure
//            NSLog(@"Error: %@ %@", error, [error userInfo]);
//        }
//    }];
//    }
}

@end
