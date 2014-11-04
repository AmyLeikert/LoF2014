//
//  ALToDoTable.h
//  LakesKraken
//
//  Created by Leikert, Amy on 10/23/14.
//  Copyright (c) 2014 DetroitLabsUser. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface ALToDoTable : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) IBOutlet UITableView *tableView;

@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

@end