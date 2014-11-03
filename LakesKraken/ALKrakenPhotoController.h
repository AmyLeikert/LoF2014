//
//  ALKrakenPhotoController.h
//  LakesKraken
//
//  Created by DetroitLabsUser on 7/28/14.
//  Copyright (c) 2014 DetroitLabsUser. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ALKrakenPhotoController : UIViewController <UICollectionViewDelegate, UICollectionViewDataSource>
@property (nonatomic, strong) NSMutableArray *urlArray;
@property (weak) IBOutlet UICollectionView *photoCollectionView;
@property (strong, nonatomic) IBOutlet UIButton *backButton;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *indicator;

@end
