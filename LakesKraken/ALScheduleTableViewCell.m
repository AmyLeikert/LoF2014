//
//  ALScheduleTableViewCell.m
//  LakesKraken
//
//  Created by DetroitLabsUser on 7/15/14.
//  Copyright (c) 2014 DetroitLabsUser. All rights reserved.
//

#import "ALScheduleTableViewCell.h"

@implementation ALScheduleTableViewCell

//-(void)customizeCellLabelText:(UILabel*)cellLabel textFieldText:(UITextView*)textField {
//    cellLabel.font = [UIFont fontWithName:@"AmericanTypewriter-Bold" size:16];
//    textField.font = [UIFont fontWithName:@"AmericanTypewriter-Bold" size:16];
//    
//}

- (void)awakeFromNib
{
    // Initialization code
    
    self.eventDescriptionText.editable = YES;
    self.eventDescriptionText.font = [UIFont fontWithName:@"AmericanTypewriter" size:12];;
    self.eventDescriptionText.editable = NO;
    
   // self.eventDescriptionText.font =[UIFont fontWithName:@"AmericanTypewriter" size:16];
    self.timeLabel.font = [UIFont fontWithName:@"AmericanTypewriter" size:12];
    self.eventNameLabel.font = [UIFont fontWithName:@"AmericanTypewriter-Bold" size:14];
    self.siteLabel.font = [UIFont fontWithName:@"AmericanTypewriter" size:12];
    self.dayLabel.font = [UIFont fontWithName:@"AmericanTypewriter" size:12];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
