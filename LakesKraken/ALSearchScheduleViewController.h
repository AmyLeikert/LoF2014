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
#import "ALFilterEvent.h"
#import "ALParseQuery.h"


@interface ALSearchScheduleViewController : UIViewController <UIPickerViewDelegate, UIPickerViewDataSource>

@property (nonatomic, strong) IBOutlet UIButton *allDayButton;
@property (nonatomic, strong) ALFilterEvent *filterEvent;
@property (nonatomic, strong) IBOutlet UIButton *searchButton;
@property (nonatomic, strong) IBOutlet UIPickerView *picker;
@property (nonatomic, strong) ALParseQuery *parse;
@property (nonatomic, strong) IBOutlet UIButton *freeFoodButton;


@property (nonatomic, strong) NSArray *dayArray;
@property (nonatomic, strong) NSArray *timeArray;
@property (nonatomic, strong) NSArray *PMArray;

@end

