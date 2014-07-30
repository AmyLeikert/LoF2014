//
//  ALScheduleTableViewCell.h
//  LakesKraken
//
//  Created by DetroitLabsUser on 7/15/14.
//  Copyright (c) 2014 DetroitLabsUser. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ALScheduleTableViewCell : UITableViewCell

@property (nonatomic, strong) IBOutlet UILabel *timeLabel;
@property (nonatomic, strong) IBOutlet UILabel *dayLabel;
@property (nonatomic, strong) IBOutlet UILabel *siteLabel;
@property (nonatomic, strong) IBOutlet UILabel *eventNameLabel;
@property (nonatomic, strong) IBOutlet UITextView *eventDescriptionText;

@end
