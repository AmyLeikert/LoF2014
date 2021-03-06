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
#import "menuViewController.h"


@interface ALToDoTable ()  <NSFetchedResultsControllerDelegate>

@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;
@property (strong, nonatomic) NSIndexPath *selection;

@end

@implementation ALToDoTable

- (void)viewDidLoad
{
    
    [super viewDidLoad];
    
    self.tableView.backgroundColor = [UIColor redColor];
    
     self.view.backgroundColor = [UIColor colorWithRed:1 green:0.937 blue:0.78 alpha:1];

//    [self.tableView setEditing:YES animated:YES];
//    
//     self.tableView.allowsMultipleSelectionDuringEditing = NO;
    
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
    
    NSLog(@"%@", self.managedObjectContext);
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    if (error) {
        NSLog(@"Unable to perform fetch.");
        NSLog(@"%@, %@", error, error.localizedDescription);
    }
    [self oneTimeMethodCall];
    
}


//- (void)setEditing:(BOOL)editing animated:(BOOL)animated
//{
//    self.tableView.allowsMultipleSelectionDuringEditing = editing;
//    [super setEditing:editing animated:animated];
//}


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


- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
        return YES;
}

- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    return NO;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        NSManagedObject *record = [self.fetchedResultsController objectAtIndexPath:indexPath];
        
        if (record) {
            [self.fetchedResultsController.managedObjectContext deleteObject:record];
            NSError *error;
            [self.managedObjectContext save:&error];
        }
    }
}



-(IBAction)segueAddToDoItem:(id)sender {
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
    
    
    NSArray *sections = [self.fetchedResultsController sections];
    id<NSFetchedResultsSectionInfo> sectionInfo = [sections objectAtIndex:section];
    
    NSLog(@"%lu", (unsigned long)[sectionInfo numberOfObjects]);
    
    return [sectionInfo numberOfObjects];
}



 - (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
 {
     
     self.tableView.backgroundColor = [UIColor colorWithRed:1 green:0.937 blue:0.78 alpha:1];
     
     
     ALToDoCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
      [cell setEditing:YES animated:YES];
     
    if (!cell) {
        [tableView registerNib:[UINib nibWithNibName:@"ALToDoCell" bundle:nil] forCellReuseIdentifier:@"cell"];
        cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    }

 
     
     [self configureCell:cell atIndexPath:indexPath];
     
 // Configure the cell...
 
 return cell;
 }



- (void)configureCell:(ALToDoCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    // Fetch Record
    NSManagedObject *record = [self.fetchedResultsController objectAtIndexPath:indexPath];
    
    // Update Cell
    [cell.nameLabel setText:[record valueForKey:@"name"]];
    [cell.packedButton setSelected:[[record valueForKey:@"packed"] boolValue]];
    
    [cell setDidTapPackedButtonBlock:^{
        BOOL isDone = [[record valueForKey:@"packed"] boolValue];
        
        // Update Record
        [record setValue:@(!isDone) forKey:@"packed"];
        NSError *error;
        [self.managedObjectContext save:&error];
    }];
}

-(BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    return YES;
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewCellEditingStyleDelete;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    // Store Selection
    [self setSelection:indexPath];
    }



//- (void)viewDidLoad
//{
//    
//    [super viewDidLoad];
//    
//    //    [self.tableView setEditing:YES animated:YES];
//    //
//    //     self.tableView.allowsMultipleSelectionDuringEditing = NO;
//    
//    self.managedObjectContext = [(ALAppDelegate *)[[UIApplication sharedApplication] delegate] managedObjectContext];
//    
//    NSManagedObjectContext *moc = [(ALAppDelegate *)[[UIApplication sharedApplication] delegate] managedObjectContext];
//    
//    NSEntityDescription *entityDescription = [NSEntityDescription
//                                              entityForName:@"Entity" inManagedObjectContext:self.managedObjectContext];
//    
//    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"Entity"];
//    
//    
//    [fetchRequest setEntity:entityDescription];
//    
//    [fetchRequest setSortDescriptors:@[[NSSortDescriptor sortDescriptorWithKey:@"createdAt" ascending:YES]]];
//    
//    self.fetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest managedObjectContext:self.managedObjectContext sectionNameKeyPath:nil cacheName:nil];
//    
//    
//    [self.fetchedResultsController setDelegate:self];
//    NSError *error = nil;
//    [self.fetchedResultsController performFetch:&error];
//    
//    
//    self.navigationController.navigationBar.translucent = NO;
//    
//    self.title = @"What To Pack";
//    
//    NSLog(@"%@", self.managedObjectContext);
//    
//    
//    UIBarButtonItem *addToDoItem = [[UIBarButtonItem alloc]
//                                    initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
//                                    target:self
//                                    action:@selector(segueToAddToDoItem)];
//    self.navigationItem.rightBarButtonItem = addToDoItem;
//    // Uncomment the following line to preserve selection between presentations.
//    // self.clearsSelectionOnViewWillAppear = NO;
//    
//    if (error) {
//        NSLog(@"Unable to perform fetch.");
//        NSLog(@"%@, %@", error, error.localizedDescription);
//    }
//    
//}



-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES];
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO];
}


- (IBAction)backTouched:(id)sender {
    menuViewController *menu = [[menuViewController alloc]init];
    [self.navigationController pushViewController:menu animated:YES];
}

-(void)addStuff {
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Entity" inManagedObjectContext:self.managedObjectContext];
    
    NSArray *array = @[@"Tent + Stakes", @"Sunscreen", @"Earplugs", @"Water bottle", @"Baby Wipes", @"Snacks", @"MOOP/Trash Bag"];
    
    for (NSString *string in array) {
        
        NSManagedObject *thing = [[NSManagedObject alloc] initWithEntity:entity insertIntoManagedObjectContext:self.managedObjectContext];
        
        [thing setValue:string forKey:@"name"];
    }
    
    NSError *error;
    [self.managedObjectContext save:&error];
}

- (void)oneTimeMethodCall{
    BOOL was_called = [[NSUserDefaults standardUserDefaults] boolForKey: @"was_called"];
    if (!was_called) {
        [self addStuff];
        //Call method you want to be called once here
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey: @"was_called"];
    }
}

@end
