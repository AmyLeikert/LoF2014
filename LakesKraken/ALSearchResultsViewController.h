//
//  ALSearchResultsViewController.h
//  LakesKraken
//
//  Created by DetroitLabsUser on 7/21/14.
//  Copyright (c) 2014 DetroitLabsUser. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ALFilterEvent.h"
#import "ALParseQuery.h"

@interface ALSearchResultsViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong) ALFilterEvent *filterEvent;
@property (nonatomic, strong) IBOutlet UILabel *testLabel;
@property (nonatomic, strong) IBOutlet UITableView *tableResults;


@end
