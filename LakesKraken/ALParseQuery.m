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


//-(NSArray*)fetchDataFromParse:(ALFilterEvent *)filterEvent {
//    NSLog(@"hello");
//    self.event = [[ALEvent alloc]init];
//    // ALEvent *event = [[ALEvent alloc]init];
//    //  self.event = event;
//
//    
//    self.event.resultsArray = [[NSMutableArray alloc]init];

 
    //self.searchView = [[ALSearchResultsViewController alloc]init];
   // ALSearchResultsViewController *searchResults = [[ALSearchResultsViewController alloc]init];
        //searchResults.event = self.event
    
       // searchResults.event = self.event;

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
    

//
    
//    if ([filterEvent.PMPickerValue isEqual: @"AM"] && filterEvent.freeFood == YES && filterEvent.allDay == NO) {
//        [query whereKey:@"Days" equalTo:filterEvent.dayPickerValue];
//        [query whereKey:@"hoursAM" equalTo:filterEvent.timePickerValue];
//        [query whereKey:@"allDay" equalTo:@NO];
//        [query whereKey:@"food" equalTo:@YES];
//               [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
//            if (!error) {
//                for (PFObject *object in objects) {
//                
//                    self.event.eventDescription = object[@"description"];
//                    self.event.startTime = object[@"startTime"];
//                    [self.event.resultsArray addObject:self.event];
//                    
//                //    NSLog(@"%@", [self.event.resultsArray description]);
//                   
//                
//                    //Bookmark'd. Make an array property. (In a class. not in this method!)
//                    //To access a specific property in the array, do as follows below: V
//                    //    eventsArray[0].eventDescription;
//                }
//            }
//               }];
//
//    }
//    
//    
//    else if ([filterEvent.PMPickerValue isEqual: @"PM"] && filterEvent.freeFood == YES && filterEvent.allDay == NO) {
//        [query whereKey:@"allDay" equalTo:@NO];
//        [query whereKey:@"food" equalTo:@YES];
//        [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
//            if (!error) {
//                for (PFObject *object in objects) {
//                    self.event.eventDescription = object[@"description"];
//                    self.event.startTime = object[@"startTime"];
//                }
//            }
//        }];
//    }
//
//    
//    else if (filterEvent.allDay == YES && filterEvent.freeFood == YES) {
//        [query whereKey:@"allDay" equalTo:@YES];
//        [query whereKey:@"food" equalTo:@YES];
//        [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
//            if (!error) {
//                for (PFObject *object in objects) {
//                    self.event.eventDescription = object[@"description"];
//                    self.event.startTime = object[@"startTime"];
//                }
//            }
//        }];
//    }
//
//     else if (filterEvent.allDay == YES) {
//        [query whereKey:@"allDay" equalTo:@YES];
//        [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
//            if (!error) {
//                for (PFObject *object in objects) {
//                    self.event.eventDescription = object[@"description"];
//                    self.event.startTime = object[@"startTime"];
//                    [self.event.resultsArray addObject:self.event];
//                    
//                    NSLog(@"%@", [self.event.resultsArray description]);
//                }
//            }
//
//         }];
//    }
//    
//
//    return [self.event.resultsArray copy];
    
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
