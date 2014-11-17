//
//  ALMapViewController.m
//  LakesKraken
//
//  Created by Leikert, Amy on 11/17/14.
//  Copyright (c) 2014 DetroitLabsUser. All rights reserved.
//

#import "ALMapViewController.h"

@interface ALMapViewController ()

@end

@implementation ALMapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
-(IBAction)setMap:(id)sender {
    switch (((UISegmentedControl*)sender).selectedSegmentIndex) {
        case 0:
            self.mapview.mapType = MKMapTypeStandard;
            break;
        case 1:
            self.mapview.mapType = MKMapTypeSatellite;
        case 2:
            self.mapview.mapType = MKMapTypeHybrid;
        default:
            break;
    }
    
}

-(IBAction)GetLocation:(id)sender{
    self.mapview.showsUserLocation = YES;
}


-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES];
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO];
}

@end
