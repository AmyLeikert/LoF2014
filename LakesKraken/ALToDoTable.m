//
//  ALToDoTable.m
//  LakesKraken
//
//  Created by Leikert, Amy on 10/23/14.
//  Copyright (c) 2014 DetroitLabsUser. All rights reserved.
//

#import "ALToDoTable.h"
#import "ALAddToDoItem.h"
#import "ALToDoCell.h"
#import "ALAppDelegate.h"
#import <CoreData/CoreData.h>



@interface ALToDoTable ()  <NSFetchedResultsControllerDelegate>

@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;
@property (strong, nonatomic) NSIndexPath *selection;

@end

@implementation ALToDoTable

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
    
    //NSManagedObjectContext *moc = [(ALAppDelegate *)[[UIApplication sharedApplication] delegate] managedObjectContext];
    self.managedObjectContext = [(ALAppDelegate *)[[UIApplication sharedApplication] delegate] managedObjectContext];
    NSEntityDescription *entityDescription = [NSEntityDescription
                                              entityForName:@"Entity" inManagedObjectContext:self.managedObjectContext];
    
    
    
     NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"Entity"];

    [fetchRequest setEntity:entityDescription];
    
    [fetchRequest setSortDescriptors:@[[NSSortDescriptor sortDescriptorWithKey:@"createdAt" ascending:YES]]];
    self.fetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest managedObjectContext:self.managedObjectContext sectionNameKeyPath:nil cacheName:nil];
    [self.fetchedResultsController setDelegate:self];
    NSError *error = nil;
    [self.fetchedResultsController performFetch:&error];
    
    
    self.navigationController.navigationBar.translucent = NO;
    
    self.title = @"What To Pack";
    
   // [self.tableView registerClass: [UITableViewCell class] forCellReuseIdentifier:@"cell"];
    

        
    NSLog(@"%@", self.managedObjectContext);

    
    UIBarButtonItem *addToDoItem = [[UIBarButtonItem alloc]
                                    initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
                                    target:self
                                    action:@selector(segueToAddToDoItem)];
    self.navigationItem.rightBarButtonItem = addToDoItem;
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    
    
    
    
    if (error) {
        NSLog(@"Unable to perform fetch.");
        NSLog(@"%@, %@", error, error.localizedDescription);
    }

}

-(void)prePopulateData {
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Entity" inManagedObjectContext:self.managedObjectContext];
    
    // Initialize Record
    NSManagedObject *record = [[NSManagedObject alloc] initWithEntity:entity insertIntoManagedObjectContext:self.managedObjectContext];
    
    // Populate Record
    [record setValue:@"Propane Grill" forKey:@"name"];
    [record setValue:@"Earplugs" forKey:@"name"];
    [record setValue:@"Tent" forKey:@"name"];
    [record setValue:@"Sunscreen" forKey:@"name"];
    
}


-(void)segueToAddToDoItem {
    ALAddToDoItem *add = [[ALAddToDoItem alloc]init];
    [add setManagedObjectContext:self.managedObjectContext];
    [self.navigationController pushViewController:add animated:YES];
    
    if (self.selection) {
        // Fetch Record
        NSManagedObject *record = [self.fetchedResultsController objectAtIndexPath:self.selection];
        
        //if (record) {
          //  [add setRecord:record];
       // }
        
        // Reset Selection
        [self setSelection:nil];
    }

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return [[self.fetchedResultsController sections] count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSArray *prepopulatedData = 
    
    
    NSArray *sections = [self.fetchedResultsController sections];
    id<NSFetchedResultsSectionInfo> sectionInfo = [sections objectAtIndex:section];
    
    return [sectionInfo numberOfObjects];
}



 - (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
 {
    // [tableView registerClass: [UITableViewCell class] forCellReuseIdentifier:@"cell"];
     
     ALToDoCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
     
    if (!cell) {
        [tableView registerNib:[UINib nibWithNibName:@"ALToDoCell" bundle:nil] forCellReuseIdentifier:@"cell"];
        cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    }

 
     
     [self configureCell:cell atIndexPath:indexPath];
     
 // Configure the cell...
 
 return cell;
 }

- (void)controllerWillChangeContent:(NSFetchedResultsController *)controller {
    [self.tableView beginUpdates];
}

- (void)controllerDidChangeContent:(NSFetchedResultsController *)controller {
    [self.tableView endUpdates];
}

- (void)controller:(NSFetchedResultsController *)controller didChangeObject:(id)anObject atIndexPath:(NSIndexPath *)indexPath forChangeType:(NSFetchedResultsChangeType)type newIndexPath:(NSIndexPath *)newIndexPath {
    
    switch (type) {
        case NSFetchedResultsChangeInsert: {
            [self.tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:newIndexPath] withRowAnimation:UITableViewRowAnimationFade];
            break;
        }
        case NSFetchedResultsChangeDelete: {
            [self.tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
            break;
        }
        case NSFetchedResultsChangeUpdate: {
            [self configureCell:(ALToDoCell *)[self.tableView cellForRowAtIndexPath:indexPath] atIndexPath:indexPath];
            break;
        }
        case NSFetchedResultsChangeMove: {
            [self.tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
            [self.tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:newIndexPath] withRowAnimation:UITableViewRowAnimationFade];
            break;
        }
    }
}

- (void)configureCell:(ALToDoCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    // Fetch Record
    NSManagedObject *record = [self.fetchedResultsController objectAtIndexPath:indexPath];
    
    // Update Cell
    [cell.nameLabel setText:[record valueForKey:@"name"]];
    [cell.packedButton setSelected:[[record valueForKey:@"packed"] boolValue]];
}

@end
