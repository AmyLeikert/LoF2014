//
//  menuViewController.h
//  
//
//  Created by DetroitLabsUser on 7/14/14.
//
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import "ALEvent.h"

@interface menuViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong) IBOutlet UITableView *menuTable;


@end
