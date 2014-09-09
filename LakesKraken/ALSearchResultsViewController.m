//
//  ALSearchResultsViewController.m
//  LakesKraken
//
//  Created by DetroitLabsUser on 7/21/14.
//  Copyright (c) 2014 DetroitLabsUser. All rights reserved.
//

#import "ALSearchResultsViewController.h"
#import "ALSearchScheduleViewController.h"


@interface ALSearchResultsViewController ()

@end

@implementation ALSearchResultsViewController

-(void)setEvents:(NSArray *)events {
    _events = events;
    [self.tableResults reloadData];
     
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [self.events count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UIView* bview = [[UIView alloc] init];
    
    bview.backgroundColor = [UIColor colorWithRed:0.173 green:0.082 blue:0 alpha:1];
    [tableView setBackgroundView:bview];
    
    
    ALScheduleTableViewCell *eventCell = [tableView dequeueReusableCellWithIdentifier:@"thumbCell"];
    
    if (eventCell) {
        [tableView registerNib:[UINib nibWithNibName:@"ALScheduleTableViewCell" bundle:nil] forCellReuseIdentifier:@"thumbCell"];
        eventCell = [tableView dequeueReusableCellWithIdentifier:@"thumbCell"];
    }
    if (indexPath.section == 0) {
       ALEvent *event = self.events[indexPath.row];
        [eventCell.eventDescriptionText setText:event.eventDescription];
        [eventCell.eventNameLabel setText:event.eventName];
        [eventCell.siteLabel setText:event.siteLocation];
        [eventCell.timeLabel setText:[NSString stringWithFormat:@"%@ %@", event.startTime, event.endTime]];
        [eventCell.dayLabel setText:event.days];
        if (event.freeFood == YES) {
            [eventCell.yummyImage setImage:[UIImage imageNamed:@"forkknife.png"]];
            [eventCell.yummyImage2 setImage:[UIImage imageNamed:@"forkknife.png"]];
             };
    }
    
    
    return eventCell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.01f;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self.tableResults registerClass: [UITableViewCell class]forCellReuseIdentifier:@"thumbCell"];
    self.view.backgroundColor = [UIColor colorWithRed:0.173 green:0.082 blue:0 alpha:1];
    self.barView.backgroundColor = [UIColor colorWithRed:0.173 green:0.082 blue:0 alpha:1];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];

}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES];
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO];
}

-(IBAction)goBackPressed:(id)sender {
    ALSearchScheduleViewController *searchView = [[ALSearchScheduleViewController alloc]init];

    [self.navigationController pushViewController:searchView animated:YES];
}


@end
