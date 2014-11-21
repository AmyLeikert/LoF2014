//
//  ALPrincipleDescriptionController.h
//  LakesKraken
//
//  Created by Leikert, Amy on 11/21/14.
//  Copyright (c) 2014 DetroitLabsUser. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ALPrincipleDescriptionController : UIViewController
@property (nonatomic, strong) NSString *princName;
@property (nonatomic, strong) IBOutlet UITextView *descripText;
@property (nonatomic, strong) IBOutlet UILabel *nameLabel;

@end
