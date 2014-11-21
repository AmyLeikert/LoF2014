//
//  ALPrinciplesViewController.m
//  LakesKraken
//
//  Created by Leikert, Amy on 11/18/14.
//  Copyright (c) 2014 DetroitLabsUser. All rights reserved.
//

#import "ALPrinciplesViewController.h"
#import "ALPrincipleDescriptionController.h"

@interface ALPrinciplesViewController ()

@end

//NSString* const cellReuseIdentifier = @"cellIdentifier";
@implementation ALPrinciplesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.table registerClass: [UITableViewCell class] forCellReuseIdentifier:@"cellReuseIdentifier"];
    
    NSString *stream = @"https://www.youtube.com/watch?v=ysl-Yu4Rhdw";
    NSURL *url = [NSURL URLWithString:stream];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:request];
    
   // NSURL *url = [NSURL URLWithString:@"<iframe width=\"266\" height=\"185\" src=\"//www.youtube.com/embed/11lv6i79sQo\" frameborder=\"0\" allowfullscreen></iframe>"];
                  
   // NSString* url = @"<iframe width=\"266\" height=\"185\" src=\"//www.youtube.com/embed/ysl-Yu4Rhdw\" frameborder=\"0\" allowfullscreen></iframe>";
    
  //  [self.webView loadHTMLString:url baseURL:nil];
    
  //  NSURLRequest *request = [NSURLRequest requestWithURL:url];
   // [self.webView loadRequest:request];
    
//    NSURL *url = [NSURL URLWithString:@"http://youtu.be/11lv6i79sQo"];
//    NSURLRequest *request = [NSURLRequest requestWithURL:url];
//    [self.webView loadRequest:request];
    

    
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
    
    ALPrincipleDescriptionController *descripView = [[ALPrincipleDescriptionController alloc]init];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellReuseIdentifier" forIndexPath:indexPath];
    
    if (!cell) {
        cell = [tableView dequeueReusableCellWithIdentifier:@"cellReuseIdentifier"];
    }
    
    switch ([indexPath row])
    {
        case 0:
            cell.textLabel.text = @"Radical Inclusion";
            break;
        case 1:
            cell.textLabel.text = @"Gifting";
            break;
        case 2:
            cell.textLabel.text = @"Decommodification";
            break;
        case 3:
            cell.textLabel.text = @"Radical Self-Reliance";
            break;
        case 4:
            cell.textLabel.text = @"Radical Self-Expression";
            break;
        case 5:
            cell.textLabel.text = @"Communal Effort";
            break;
        case 6:
            cell.textLabel.text = @"Civic Responsibility";
            break;
        case 7:
            cell.textLabel.text = @"Leave No Trace";
            break;
        case 8:
            cell.textLabel.text = @"Participation";
            break;
        case 9:
            cell.textLabel.text = @"Immediacy";
            break;
        default:
            break;
            
    }
    
    [cell setBackgroundColor:[UIColor clearColor]];
    cell.textLabel.textAlignment = UITextAlignmentCenter;
    
    cell.textLabel.font = [UIFont fontWithName:@"AmericanTypewriter" size:16];
    
    return cell;
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES];   //it hides
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO];    // it shows
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *selectedCell = [tableView cellForRowAtIndexPath:indexPath];
    NSString *cellText = selectedCell.textLabel.text;
    ALPrincipleDescriptionController *princDescrip = [[ALPrincipleDescriptionController alloc]init];
    princDescrip.princName = cellText;
    
    [self.navigationController pushViewController:princDescrip animated:YES];
    
    
    
}

@end
