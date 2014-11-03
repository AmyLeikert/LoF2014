//
//  ALAddToDoItem.m
//  
//
//  Created by DetroitLabsUser on 9/8/14.
//
//

#import "ALAddToDoItem.h"
#import "ALToDoTable.h"

@interface ALAddToDoItem ()

@end

@implementation ALAddToDoItem

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
    
    self.view.backgroundColor = [UIColor colorWithRed:1 green:0.937 blue:0.78 alpha:1];
    self.navigationController.navigationBar.translucent = NO;
    // Do any additional setup after loading the view from its nib.
    
    UIBarButtonItem *addToDoItem = [[UIBarButtonItem alloc]
                                    initWithBarButtonSystemItem:UIBarButtonSystemItemSave                                    target:self
                                    action:@selector(save)];
    self.navigationItem.rightBarButtonItem = addToDoItem;
}


-(void)segueToAddToDoItem {
    ALToDoTable *toDoList = [[ALToDoTable alloc]init];
    [self.navigationController pushViewController:toDoList animated:YES];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)cancel:(id)sender {
    
}

- (void)save {
            // Helpers
        NSString *name = self.textField.text;
        
        if (name && name.length) {
            // Create Entity
            NSEntityDescription *entity = [NSEntityDescription entityForName:@"Entity" inManagedObjectContext:self.managedObjectContext];
            
            // Initialize Record
            NSManagedObject *record = [[NSManagedObject alloc] initWithEntity:entity insertIntoManagedObjectContext:self.managedObjectContext];
            
            // Populate Record
            [record setValue:name forKey:@"name"];
            [record setValue:[NSDate date] forKey:@"createdAt"];
            
            // Save Record
            NSError *error = nil;
            
            ALToDoTable *toDoList = [[ALToDoTable alloc]init];
            [self.navigationController pushViewController:toDoList animated:YES];
            
            if ([self.managedObjectContext save:&error]) {
                // Dismiss View Controller
                [self dismissViewControllerAnimated:YES completion:nil];
                
            } else {
                if (error) {
                    NSLog(@"Unable to save record.");
                    NSLog(@"%@, %@", error, error.localizedDescription);
                }
                
                // Show Alert View
                [[[UIAlertView alloc] initWithTitle:@"Warning" message:@"Your to-do could not be saved." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil] show];
            }
            
        } else {
            // Show Alert View
            [[[UIAlertView alloc] initWithTitle:@"Warning" message:@"Your to-do needs a name." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil] show];
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
