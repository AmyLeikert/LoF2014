//
//  ALWelcomeView.m
//  LakesKraken
//
//  Created by DetroitLabsUser on 6/16/14.
//  Copyright (c) 2014 DetroitLabsUser. All rights reserved.
//

#import "ALWelcomeView.h"
#import <AVFoundation/AVFoundation.h>
#import "menuViewController.h"


@interface ALWelcomeView ()
@property (nonatomic, strong) menuViewController *menuView;

@end

@implementation ALWelcomeView

-(IBAction)buttonPressed:(id)sender {
    self.menuView = [[menuViewController alloc]initWithNibName:@"menuViewController" bundle:nil];
    [self.navigationController pushViewController:self.menuView animated:YES];
    [self.avSound stop];
}

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
    self.yearLabel.font = [UIFont fontWithName:@"AmericanTypewriter" size:16];
  
    [self.navigationController setNavigationBarHidden:YES];
    
    [self soundOceanWaves];
    [Parse setApplicationId:@"y8zOoUCmfdBwkLaTLuO7yIlXM0hHPiWKiiHbGAv6"
                  clientKey:@"450qoRIbgFWEaK0OtvLFn3cJn2RgkMQo5vh6pZPg"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)soundOceanWaves{
    
    NSURL *soundURL = [[NSBundle mainBundle] URLForResource:@"OceanSounds" withExtension:@"mp3"];
    
    self.avSound = [[AVAudioPlayer alloc]initWithContentsOfURL:soundURL error:nil];
    [self.avSound play];
    
};

@end
