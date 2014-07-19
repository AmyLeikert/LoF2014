//
//  ALSearchScheduleViewController.m
//  LakesKraken
//
//  Created by DetroitLabsUser on 7/15/14.
//  Copyright (c) 2014 DetroitLabsUser. All rights reserved.
//

#import "ALSearchScheduleViewController.h"

@interface ALSearchScheduleViewController ()

@end

@implementation ALSearchScheduleViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self parseTesting];

    

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)parseTesting {
    PFQuery *query = [PFQuery queryWithClassName:@"schedule"];
    [query whereKey:@"hoursAM" containedIn:@[@"10"]];
    [query whereKey:@"allDay" equalTo:@NO];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            // The find succeeded.
            NSLog(@"Successfully retrieved %d scores.", objects.count);
            // Do something with the found objects
            for (PFObject *object in objects) {
               // self.event1.eventDescription = object[@"description"];
                self.event1.startTime = object[@"endTime"];
                
                //NSLog(@"%@", object[@"description"]);
             
            }
        } else {
            // Log details of the failure
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        }
    }];
}

@end
