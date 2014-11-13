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
#import "menuViewController.h"

@interface ALSearchScheduleViewController ()

@end

@implementation ALSearchScheduleViewController

- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view
{
    UILabel* tView = (UILabel*)view;
    if (!tView)
    {
        tView = [[UILabel alloc] init];
        [tView setFont:[UIFont fontWithName:@"AmericanTypewriter-Bold" size:18]];
        tView.textColor = [UIColor brownColor];

        [tView setTextAlignment:UITextAlignmentCenter];
        tView.numberOfLines=3;
    }

    if (component == 0) {
        tView.text = [self.dayArray objectAtIndex:row];
    }
    
    if (self.allDayButton.selected) {
        if (component == 1) {
            return nil;
            
        }
        if (component == 2) {
            return nil;
            
        }
    }

    if (!self.allDayButton.selected) {
        if (component == 1) {
            tView.text = [self.timeArray objectAtIndex:row];
        }
    }
    
    if (component == 2) {
        tView.text = [self.PMArray objectAtIndex:row];
    }

    
    return tView;
}

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

-(IBAction)freeFoodPressed:(id)sender {
    self.filterEvent.freeFood = !self.filterEvent.freeFood;
    self.freeFoodButton.selected = self.filterEvent.freeFood;

}

-(IBAction)searchPressed:(id)sender {
    ALSearchResultsViewController *searchResults = [[ALSearchResultsViewController alloc]init];
    self.filterEvent.dayPickerValue = [self.dayArray objectAtIndex:[self.picker selectedRowInComponent:0]];
    
    self.filterEvent.PMPickerValue = [self.PMArray objectAtIndex:[self.picker selectedRowInComponent:2]];
    
    self.filterEvent.timePickerValue = [self.timeArray objectAtIndex:[self.picker selectedRowInComponent:1]];
    
    searchResults.filterEvent = self.filterEvent;


    
    [self.navigationController pushViewController:searchResults animated:YES];

    
    [self.parse fetchDataFromParse:self.filterEvent withResultBlock:^(NSArray *events, NSError *error) {
        [searchResults setEvents:events];
          }];
    

}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.parse = [[ALParseQuery alloc]init];
    
    self.filterEvent = [[ALFilterEvent alloc]init];
    
    [self.navigationController setNavigationBarHidden:NO];

    
    self.view.backgroundColor = [UIColor colorWithRed:1 green:0.937 blue:0.78 alpha:1];
    
    
    
    self.dayArray = @[@"Thursday", @"Friday", @"Saturday", @"Sunday"];
    self.timeArray = @[@"1:00", @"2:00", @"3:00", @"4:00", @"5:00", @"6:00", @"7:00", @"8:00", @"9:00", @"10:00", @"11:00", @"12:00"];
    self.PMArray = @[@"AM", @"PM"];

    

}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES];   //it hides
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO];    // it shows
}

-(IBAction)goBackPressed:(id)sender {
    menuViewController *menuView = [[menuViewController alloc]init];
    
    [self.navigationController pushViewController:menuView animated:YES];
}


@end
