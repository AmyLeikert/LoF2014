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
    
    [self.packedButton addTarget:self action:@selector(didTapButton:) forControlEvents:UIControlEventTouchUpInside];

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

-(IBAction)packedPressed:(id)sender {
    self.packed = !self.packed;
    self.packedButton.selected = self.packed;
    
}

- (void)didTapButton:(UIButton *)button {
    if (self.didTapPackedButtonBlock
        ) {
        self.didTapPackedButtonBlock();
    }
}

@end
