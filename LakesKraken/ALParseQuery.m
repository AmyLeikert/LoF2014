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
    
    ALSearchResultsViewController *searchResults = [[ALSearchResultsViewController alloc]init];
    

    self.event = event;
    searchResults.event = self.event;
      PFQuery *query = [PFQuery queryWithClassName:@"schedule"];
   // NSMutableArray *array = [[NSArray alloc]init];
   // NSMutableArray *eventArray = [[NSMutableArray alloc]init];

  //  searchResults.array = eventArray;
  // self.event.resultsArray = eventArray;
    
    if ([filterEvent.PMPickerValue isEqual: @"AM"] && filterEvent.freeFood == YES && filterEvent.allDay == NO) {
        [query whereKey:@"Days" equalTo:filterEvent.dayPickerValue];
        [query whereKey:@"hoursAM" equalTo:filterEvent.timePickerValue];
        [query whereKey:@"allDay" equalTo:@NO];
        [query whereKey:@"food" equalTo:@YES];
               [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
            if (!error) {
                for (PFObject *object in objects) {
                 
                    self.event.eventDescription = object[@"description"];
                    self.event.startTime = object[@"startTime"];
                    [self.event.resultsArray addObject:self.event];
                    NSLog(@"%@", [self.event.resultsArray description]);
                   
                
                    //Bookmark'd. Make an array property. (In a class. not in this method!)
                    //To access a specific property in the array, do as follows below: V
                    //    eventsArray[0].eventDescription;
                }

            }
                
        }];
        searchResults.event = self.event;
        NSLog(@"searchResults array: %@", [event.resultsArray description]);
        NSLog(@"self array: %@", [self.event.resultsArray description]);
        return [self.event.resultsArray copy];
        

        
    }
    
    
    else if ([filterEvent.PMPickerValue isEqual: @"PM"] && filterEvent.freeFood == YES && filterEvent.allDay == NO) {
        [query whereKey:@"allDay" equalTo:@NO];
        [query whereKey:@"food" equalTo:@YES];
        [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
            if (!error) {
                for (PFObject *object in objects) {
                    self.event.eventDescription = object[@"description"];
                    self.event.startTime = object[@"startTime"];
                 //   [searchResults.event.resultsArray addObject:self.event];
                   
                    
                    
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
                 //  [array addObject:self.event];
                  //  NSLog(@"%@", array);
                   
                    
                    
                    //Make an array property. (In a class. not in this method!)
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
             //       [eventArray addObject:self.event];
                  
                    
                    //Bookmark'd. Make an array property. (In a class. not in this method!)
                    //To access a specific property in the array, do as follows below: V
                //    eventsArray[0].eventDescription;
                }
            

            }
            

            
         }];

    }
    

    
    return [self.event.resultsArray copy];
}

@end
