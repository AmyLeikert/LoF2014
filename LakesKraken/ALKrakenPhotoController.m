//
//  ALKrakenPhotoController.m
//  LakesKraken
//
//  Created by DetroitLabsUser on 7/28/14.
//  Copyright (c) 2014 DetroitLabsUser. All rights reserved.
//

#import "ALKrakenPhotoController.h"
#import "ALThumbCollectionCell.h"
#import "menuViewController.h"

#define CELL_NAME    @"ThumbCollectionCell"


@interface ALKrakenPhotoController ()

@end

@implementation ALKrakenPhotoController {
    NSArray *photoArray;
    //__weak IBOutlet UICollectionView *photoCollectionView;
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
    
    
    [self.photoCollectionView registerNib:[UINib nibWithNibName:@"ALThumbCollectionCell" bundle:nil] forCellWithReuseIdentifier:CELL_NAME];
    [self.photoCollectionView reloadData];
    self.photoCollectionView.backgroundColor = [UIColor colorWithRed:0.173 green:0.082 blue:0 alpha:1];
    self.view.backgroundColor = [UIColor colorWithRed:0.173 green:0.082 blue:0 alpha:1];
    self.backButton.titleLabel.font = [UIFont fontWithName:@"AmericanTypewriter" size:16];
    self.urlArray = [[NSMutableArray alloc]init];
    
    [self.indicator startAnimating];
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return photoArray.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView*)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    ALThumbCollectionCell *thumbCell = [collectionView dequeueReusableCellWithReuseIdentifier:CELL_NAME forIndexPath:indexPath];
    
    thumbCell.layer.borderWidth = 3;
    thumbCell.layer.borderColor = [[UIColor blackColor]CGColor];
    
    int i;
    NSString *photoCode;
    NSString *photoURL;
    
    for (i = 0; i < photoArray.count; i++) {
        NSString *imgrURL = @"http://i.imgur.com/";
        photoCode = [photoArray objectAtIndex:i];
        photoURL = [imgrURL stringByAppendingString:photoCode];
        [self.urlArray addObject:photoURL];
    }
    
     //dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
     dispatch_async(dispatch_get_main_queue(), ^{
    
    thumbCell.thumbImage.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:self.urlArray[indexPath.row]]]];
         [self.indicator stopAnimating];
         
});

   return thumbCell;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)goBackPressed:(id)sender {
    menuViewController *menu = [[menuViewController alloc]init];
    [self.navigationController pushViewController:menu animated:YES];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES];   //it hides
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO];    // it shows
}


@end
