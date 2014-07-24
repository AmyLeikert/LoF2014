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
    
    NSLog(@"hello");
    
    NSMutableArray *parseArray = [[NSMutableArray alloc]init];
    ALEvent *event = [[ALEvent alloc]init];
    event.eventDescription = @"Coffee Time!";
    event.startTime = @"1:00pm";
    [parseArray addObject:event];
    
    //NSLog(@"%@", parseArray);
    return [parseArray copy];
//    PFQuery *query = [PFQuery queryWithClassName:@"schedule"a];
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

-(NSArray*)fetchDataFromParse:(ALFilterEvent *)filterEvent {
    ALEvent *event =[[ALEvent alloc]init];
                     
    PFQuery *query = [PFQuery queryWithClassName:@"schedule"];
    NSMutableArray *eventArray = [[NSMutableArray alloc]init];
    if (filterEvent.allDay == NO) {
        [query whereKey:@"allDay" equalTo:@NO];
        [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
            if (!error) {
                for (PFObject *object in objects) {
                    event.eventDescription = object[@"description"];
                    event.startTime = object[@"startTime"];
                    [eventArray addObject:event];
                    NSLog(@"%@", event.eventDescription);
                }
                
         
         }
            
         }];
    }
    return [eventArray copy];
 
}

@end
