//
//  ALPrinciplesViewController.h
//  LakesKraken
//
//  Created by Leikert, Amy on 11/18/14.
//  Copyright (c) 2014 DetroitLabsUser. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <YTPlayerView.h>

@interface ALPrinciplesViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong) IBOutlet YTPlayerView *ytView;
@property (nonatomic, weak) IBOutlet UIWebView *webView;
@property (nonatomic, strong) IBOutlet UITableView *table;

@end
