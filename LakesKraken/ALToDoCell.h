//
//  ALToDoCell.h
//  LakesKraken
//
//  Created by Leikert, Amy on 10/24/14.
//  Copyright (c) 2014 DetroitLabsUser. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^ToDoCellDidTapPackedButtonBlock)();

@interface ALToDoCell : UITableViewCell

@property (nonatomic, strong) IBOutlet UILabel *nameLabel;
@property (nonatomic, strong) IBOutlet UIButton *packedButton;
@property BOOL packed;

@property (copy, nonatomic) ToDoCellDidTapPackedButtonBlock didTapPackedButtonBlock;

@property (strong, nonatomic) IBOutlet UIButton *deleteButton;

@end
