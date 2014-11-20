//
//  ALPrinciplesViewController.m
//  LakesKraken
//
//  Created by Leikert, Amy on 11/18/14.
//  Copyright (c) 2014 DetroitLabsUser. All rights reserved.
//

#import "ALPrinciplesViewController.h"

@interface ALPrinciplesViewController ()

@end

//NSString* const cellReuseIdentifier = @"cellIdentifier";
@implementation ALPrinciplesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.table registerClass: [UITableViewCell class] forCellReuseIdentifier:@"cellReuseIdentifier"];
    
    
    NSURL *url = [NSURL URLWithString:@"http://youtu.be/11lv6i79sQo"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:request];
   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellReuseIdentifier" forIndexPath:indexPath];
    
    if (!cell) {
        cell = [tableView dequeueReusableCellWithIdentifier:@"cellReuseIdentifier"];
    }
    
    
    if (indexPath.section == 0 && indexPath.row == 0){
        
        cell.textLabel.text = @"Radical Inclusion";
    }
    
    if (indexPath.section == 0 && indexPath.row == 1){
        
        cell.textLabel.text = @"Gifting";
    }
    
    if (indexPath.section == 0 && indexPath.row == 2){
        
        cell.textLabel.text = @"Decommodification";
    }
    
    if (indexPath.section == 0 && indexPath.row == 3){
        cell.textLabel.text = @"Radical Self-Reliance";
    }
    
    if (indexPath.section == 0 && indexPath.row == 4) {
        cell.textLabel.text = @"Radical Self-Expression";
    }
    
    if (indexPath.section == 0 && indexPath.row == 5) {
        cell.textLabel.text = @"Communal Effort";
    }
    if (indexPath.section == 0 && indexPath.row == 6) {
        cell.textLabel.text = @"Civic Responsibility";
    }
    if (indexPath.section == 0 && indexPath.row == 7) {
        cell.textLabel.text = @"Leave No Trace";
    }
    if (indexPath.section == 0 && indexPath.row == 8) {
        cell.textLabel.text = @"Participation";
    }
    if (indexPath.section == 0 && indexPath.row == 9) {
        cell.textLabel.text = @"Immediacy";
    }
    
    [cell setBackgroundColor:[UIColor clearColor]];
    cell.textLabel.textAlignment = UITextAlignmentCenter;
    
    cell.textLabel.font = [UIFont fontWithName:@"AmericanTypewriter" size:16];
    
    return cell;

    
}

@end
