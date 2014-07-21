//
//  menuViewController.m
//  
//
//  Created by DetroitLabsUser on 7/14/14.
//
//

#import "menuViewController.h"
#import "ALSearchScheduleViewController.h"

@interface menuViewController ()

@end

NSString* const cellReuseIdentifier = @"cellIdentifier";
@implementation menuViewController


//- (id)initWithStyle:(UITableViewStyle)style {
//   // self = [super initWithStyle:style];
//    if (self.menuTable) {
//        [self.menuTable registerClass:[UITableViewCell class] forCellReuseIdentifier:cellReuseIdentifier];
//        
//        //self.tableView.delegate = self;
//        //   self.tableView.dataSource = self;
//    }
//    
//    return self;
//}

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
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
[self.menuTable registerClass: [UITableViewCell class] forCellReuseIdentifier:@"cellReuseIdentifier"];
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
                ALEvent *event1 = [[ALEvent alloc]init];
                event1.eventDescription = object[@"description"];
                event1.startTime = object[@"endTime"];
                
                NSLog(@"%@", event1.startTime);
                
            }
        } else {
            // Log details of the failure
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        }
    }];
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
        
        cell.textLabel.text = @"Search Schedule";
    }
    
     
    if (indexPath.section == 0 && indexPath.row == 1){
        cell.textLabel.text = @"Ten Principles";
    }
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    ALSearchScheduleViewController *searchViewController = [[ALSearchScheduleViewController alloc]init];
    if (indexPath.section == 0 && indexPath.row == 0){
    return [self.navigationController pushViewController:searchViewController animated:YES];
    }

}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
