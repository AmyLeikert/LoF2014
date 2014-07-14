//
//  ALWelcomeView.m
//  LakesKraken
//
//  Created by DetroitLabsUser on 6/16/14.
//  Copyright (c) 2014 DetroitLabsUser. All rights reserved.
//

#import "ALWelcomeView.h"


@interface ALWelcomeView ()

@end

@implementation ALWelcomeView

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self.button toggleBlink];

    self.button.titleLabel.font = [UIFont fontWithName:@"AmericanTypewriter" size:18];
    self.lakesLabel.font = [UIFont fontWithName:@"AmericanTypewriter" size:24];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
