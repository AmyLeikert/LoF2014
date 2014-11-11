//
//  ALToDoCell.m
//  LakesKraken
//
//  Created by Leikert, Amy on 10/24/14.
//  Copyright (c) 2014 DetroitLabsUser. All rights reserved.
//

#import "ALToDoCell.h"

@implementation ALToDoCell

- (void)awakeFromNib {
    [super awakeFromNib];

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

-(IBAction)packedPressed:(id)sender {
    self.packed = !self.packed;
    self.packedButton.selected = self.packed;
    
}

@end
