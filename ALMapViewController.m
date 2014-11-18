//
//  ALMapViewController.m
//  LakesKraken
//
//  Created by Leikert, Amy on 11/17/14.
//  Copyright (c) 2014 DetroitLabsUser. All rights reserved.
//

#import "ALMapViewController.h"
#import "menuViewController.h"
#import "ALMapPin.h"

@interface ALMapViewController ()

@end

@implementation ALMapViewController

@synthesize mapview;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    MKCoordinateRegion region = { {0.0, 0.0}, {0.0, 0.0} };
    region.center.latitude = 40.707184;
    region.center.longitude = -73.998392;
    region.span.longitudeDelta = 0.01f;
    region.span.latitudeDelta = 0.01f;
    [mapview setRegion:region animated:YES];
    
    
    ALMapPin *ann = [[ALMapPin alloc]init];
    ann.title = @"Brooklyn Bridge";
    ann.subtitle = @"New York";
    ann.coordinate = region.center;
    [mapview addAnnotation:ann];
    
  //  self.mapview.delegate = self;
    
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
    self.locationManager = [[CLLocationManager alloc]init];
 //   self.locationManager.delegate = self;
    
    self.locationManager.distanceFilter = 1000;
//    CLAuthorizationStatus authorizationStatus= [CLLocationManager authorizationStatus];
//     [self.locationManager requestAlwaysAuthorization];
//    if (authorizationStatus == kCLAuthorizationStatusAuthorized ||
//        authorizationStatus == kCLAuthorizationStatusAuthorizedAlways ||
//        authorizationStatus == kCLAuthorizationStatusAuthorizedWhenInUse) {
//        
//        
//       
//        [self.locationManager startUpdatingLocation];
//        mapview.showsUserLocation = YES;
//        
//    }
    

   [self.locationManager requestAlwaysAuthorization];
    mapview.showsUserLocation = YES;
    [self.locationManager startUpdatingLocation];
    mapview.userTrackingMode=YES;
    
}


-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES];
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO];
}

- (IBAction)backTouched:(id)sender {
    menuViewController *menu = [[menuViewController alloc]init];
    [self.navigationController pushViewController:menu animated:YES];
}

-(IBAction)Direction:(id)sender {
    NSString *urlString = @"http://maps.apple.com/maps?daddr=40.707184,-73998392";
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:urlString]];
}

@end
