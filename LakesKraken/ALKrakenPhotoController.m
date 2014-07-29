//
//  ALKrakenPhotoController.m
//  LakesKraken
//
//  Created by DetroitLabsUser on 7/28/14.
//  Copyright (c) 2014 DetroitLabsUser. All rights reserved.
//

#import "ALKrakenPhotoController.h"
#import "ALThumbCollectionCell.h"

#define CELL_NAME    @"ThumbCollectionCell"


@interface ALKrakenPhotoController ()

@end

@implementation ALKrakenPhotoController {
    NSArray *photoArray;
    __weak IBOutlet UICollectionView *photoCollectionView;
};


//- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
//{
//    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
//    if (self) {
//        // Custom initialization
//    }
//    return self;
//}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    photoArray = @[@"lK0RuE9.jpg",
                   @"Nipbu6N.jpg",
                   @"cq3MvGY.jpg",
                   @"OX4iqrN.jpg",
                   @"JXqxIh1.jpg",
                   @"gNEY86k.jpg",
                   @"pZravGZ.jpg",
                   @"6ioJWyK.jpg",
                   @"LzWd3YL.jpg",
                   @"MV1eGHA.jpg",
                   @"Vj32epk.jpg",
                   @"08Kbq2x.jpg",
                   @"3YAjOJm.jpg"];
    
    [photoCollectionView registerNib:[UINib nibWithNibName:@"ALThumbCollectionCell" bundle:nil] forCellWithReuseIdentifier:CELL_NAME];
    [photoCollectionView reloadData];
    
    self.urlArray = [[NSMutableArray alloc]init];
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return photoArray.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView*)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    ALThumbCollectionCell *thumbCell = [collectionView dequeueReusableCellWithReuseIdentifier:CELL_NAME forIndexPath:indexPath];
    int i;
    NSString *photoCode;
    NSString *photoURL;
    for (i = 0; i < 13; i++) {
        NSString *imgrURL = @"http://i.imgur.com/";
        photoCode = [photoArray objectAtIndex:i];
        photoURL = [imgrURL stringByAppendingString:photoCode];
        [self.urlArray addObject:photoURL];

    }
    thumbCell.thumbImage.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:self.urlArray[indexPath.row]]]];
    
   return thumbCell;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
