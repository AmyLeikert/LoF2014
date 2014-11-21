//
//  ALPrinciplesViewController.h
//  LakesKraken
//
//  Created by Leikert, Amy on 11/18/14.
//  Copyright (c) 2014 DetroitLabsUser. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ALPrincipleDescriptionController.h"

@interface ALPrinciplesViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, weak) IBOutlet UIWebView *webView;
@property (nonatomic, strong) IBOutlet UITableView *table;
@property (nonatomic, strong) ALPrincipleDescriptionController *princDescrip;
@end
