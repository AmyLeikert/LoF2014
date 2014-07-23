//
//  ALSearchScheduleViewController.m
//  LakesKraken
//
//  Created by DetroitLabsUser on 7/15/14.
//  Copyright (c) 2014 DetroitLabsUser. All rights reserved.
//

#import "ALSearchScheduleViewController.h"
#import "ALSearchResultsViewController.h"
#import "ALParseQuery.h"

@interface ALSearchScheduleViewController ()

@end

@implementation ALSearchScheduleViewController

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 3;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    if (component == 0) {
        return 4;
    }
    if (component == 1) {
        return 12;
    }
    if (component == 2) {
        return 2;
    }
    return component;
}

- (NSString *)pickerView:(UIPickerView *)pickerView
             titleForRow:(NSInteger)row
            forComponent:(NSInteger)component
{
    NSArray *dayArray = @[@"Thursday", @"Friday", @"Saturday", @"Sunday"];
    NSArray *timeArray = @[@"1:00", @"2:00", @"3:00", @"4:00", @"5:00", @"6:00", @"7:00", @"8:00", @"9:00", @"10:00", @"11:00", @"12:00"];
    NSArray *amPMArray = @[@"AM", @"PM"];
    if (component == 0) {
        return [dayArray objectAtIndex:row];
    }
    
    if (self.allDayButton.selected) {
        if (component == 1) {
            return @"";
        }
    }
    if (!self.allDayButton.selected) {
        if (component == 1) {
            return [timeArray objectAtIndex:row];
        }
    }
    
    if (component == 2) {
        return [amPMArray objectAtIndex:row];
    }
    return @"hello";
}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(IBAction)allDayPressed:(id)sender{
    self.filterEvent.allDay = !self.filterEvent.allDay;

    self.allDayButton.selected = self.filterEvent.allDay;
}

-(IBAction)searchPressed:(id)sender {
    ALSearchResultsViewController *searchResults = [[ALSearchResultsViewController alloc]init];
    searchResults.filterEvent = self.filterEvent;
    [self.navigationController pushViewController:searchResults animated:YES];

    
    ///////
    
    [self.parse parse:searchResults.filterEvent];
    NSLog(@"%@", self.parse);

}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self parseTesting];
    [self.navigationController setNavigationBarHidden:NO];
    
    self.filterEvent = [[ALFilterEvent alloc]init];
    
    self.view.backgroundColor = [UIColor colorWithRed:1 green:0.937 blue:0.78 alpha:1];
    
    self.parse = [[ALParseQuery alloc]init];

    

}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES];   //it hides
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO];    // it shows
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)parseTesting {
    PFQuery *query = [PFQuery queryWithClassName:@"schedule"];
   // [query whereKey:@"hoursAM" containedIn:@[@"10"]];
    [query whereKey:@"allDay" equalTo:@NO];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            // Do something with the found objects
            for (PFObject *object in objects) {
               self.event1.eventDescription = object[@"description"];
                self.event1.startTime = object[@"startTime"];
             
            }
        } else {
            // Log details of the failure
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        }
    }];
}


@end
