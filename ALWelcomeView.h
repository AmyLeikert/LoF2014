//
//  ALWelcomeView.h
//  LakesKraken
//
//  Created by DetroitLabsUser on 6/16/14.
//  Copyright (c) 2014 DetroitLabsUser. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <BlinkButton.h>
#import <AVFoundation/AVFoundation.h>

@interface ALWelcomeView : UIViewController
@property IBOutlet BlinkButton *button;
@property IBOutlet UILabel *lakesLabel;
@property IBOutlet UILabel *yearLabel;

@property AVAudioPlayer *avSound;

-(void)soundOceanWaves;

@end
