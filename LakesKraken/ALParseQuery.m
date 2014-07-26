//
//  ALParseQuery.m
//  LakesKraken
//
//  Created by DetroitLabsUser on 7/21/14.
//  Copyright (c) 2014 DetroitLabsUser. All rights reserved.
//

#import "ALParseQuery.h"


@implementation ALParseQuery


-(NSArray*)fetchDataFromParse:(ALFilterEvent *)filterEvent {
    NSLog(@"hell");
    ALEvent *event =[[ALEvent alloc]init];
    self.event = event;
    PFQuery *query = [PFQuery queryWithClassName:@"schedule"];
    NSMutableArray *eventArray = [[NSMutableArray alloc]init];
    
    
    
    if ([filterEvent.PMPickerValue isEqual: @"AM"] && filterEvent.freeFood == YES && filterEvent.allDay == NO) {
        [query whereKey:@"allDay" equalTo:@NO];
        [query whereKey:@"food" equalTo:@YES];
        [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
            if (!error) {
                for (PFObject *object in objects) {
                    self.event.eventDescription = object[@"description"];
                    self.event.startTime = object[@"startTime"];
                    [eventArray addObject:event];
                    NSLog(@"%@", event.eventDescription);
                    
                    
                    //Bookmark'd. Make an array property. (In a class. not in this method!)
                    //To access a specific property in the array, do as follows below: V
                    //    eventsArray[0].eventDescription;
                }
            }
            
        }];
        
    }
    
    else if (filterEvent.allDay == YES && filterEvent.freeFood == YES) {
        [query whereKey:@"allDay" equalTo:@YES];
        [query whereKey:@"food" equalTo:@YES];
        [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
            if (!error) {
                for (PFObject *object in objects) {
                    self.event.eventDescription = object[@"description"];
                    self.event.startTime = object[@"startTime"];
                    [eventArray addObject:event];
                    NSLog(@"%@", event.eventDescription);
                    
                    
                    //Bookmark'd. Make an array property. (In a class. not in this method!)
                    //To access a specific property in the array, do as follows below: V
                    //    eventsArray[0].eventDescription;
                }
            }
            
        }];
        
    }

     else if (filterEvent.allDay == YES) {
        [query whereKey:@"allDay" equalTo:@YES];
        [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
            if (!error) {
                for (PFObject *object in objects) {
                    self.event.eventDescription = object[@"description"];
                   self.event.startTime = object[@"startTime"];
                    [eventArray addObject:event];
                    NSLog(@"%@", event.startTime);
                    
                    
                    //Bookmark'd. Make an array property. (In a class. not in this method!)
                    //To access a specific property in the array, do as follows below: V
                //    eventsArray[0].eventDescription;
                }
            }
            
         }];
    }
    
      return [eventArray copy];

}

@end
