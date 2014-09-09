//
//  ALThumbCollectionCell.m
//  LakesKraken
//
//  Created by DetroitLabsUser on 7/29/14.
//  Copyright (c) 2014 DetroitLabsUser. All rights reserved.
//

#import "ALThumbCollectionCell.h"
#import "EXPhotoViewer.h"

@implementation ALThumbCollectionCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (IBAction)onButtonTUI:(id)sender {
    [EXPhotoViewer showImageFrom:self.thumbImage];
}



@end
