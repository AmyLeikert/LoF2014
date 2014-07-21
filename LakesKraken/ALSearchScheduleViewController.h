//
//  ALSearchScheduleViewController.h
//  LakesKraken
//
//  Created by DetroitLabsUser on 7/15/14.
//  Copyright (c) 2014 DetroitLabsUser. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import "ALEvent.h"

@interface ALSearchScheduleViewController : UIViewController
@property (nonatomic, strong) ALEvent *event1;
@property (nonatomic, strong) UIButton *allDayButton;

@end
