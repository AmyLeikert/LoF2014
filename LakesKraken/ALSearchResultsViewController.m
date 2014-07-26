//
//  ALSearchResultsViewController.m
//  LakesKraken
//
//  Created by DetroitLabsUser on 7/21/14.
//  Copyright (c) 2014 DetroitLabsUser. All rights reserved.
//

#import "ALSearchResultsViewController.h"
#import "ALParseQuery.h"

@interface ALSearchResultsViewController ()

@end

@implementation ALSearchResultsViewController

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
    
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellReuseIdentifier" forIndexPath:indexPath];
    
    if (!cell) {
        cell = [tableView dequeueReusableCellWithIdentifier:@"cellReuseIdentifier"];
    }
    
    
    if (indexPath.section == 0 && indexPath.row == 0){
        
        cell.textLabel.text = @"hello";
    }
    
    return cell;
}


-(void)testAllDayBool {
    if (self.filterEvent.freeFood == YES) {
        self.testLabel.text = @"Heck yes!";
    }
    else {
        self.testLabel.text = @"nooooope :(";
    }
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self.tableResults registerClass: [UITableViewCell class]forCellReuseIdentifier:@"cellReuseIdentifier"];
    
    
    
   // [self testAllDayBool];
  // NSLog(@"%@", self.filterEvent.dayPickerValue);

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
