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
#import "ALDirectionsViewController.h"

@interface ALMapViewController ()

@end

@implementation ALMapViewController

@synthesize mapview;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.addressLabel.textColor =[UIColor colorWithRed:0.18 green:0.102 blue:0.004 alpha:1];
    
     self.view.backgroundColor = [UIColor colorWithRed:1 green:0.937 blue:0.78 alpha:1];
    
    MKCoordinateRegion region = { {0.0, 0.0}, {0.0, 0.0} };
    region.center.latitude = 43.507774;
    region.center.longitude = -86.364268;
    region.span.longitudeDelta = 0.01f;
    region.span.latitudeDelta = 0.01f;
    [mapview setRegion:region animated:YES];
    
    ALMapPin *ann = [[ALMapPin alloc]init];
    ann.title = @"Lucky Lake Campground";
   // ann.subtitle = @"New York";
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
    NSLog(@"called");
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
//    NSString *urlString = @"http://maps.apple.com/maps?daddr=43.507701,-86.364191";
//    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:urlString]];
    
    UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"Directions" message:@"Where are you starting from?" delegate:self cancelButtonTitle:@"Continue" otherButtonTitles:nil];
    alert.alertViewStyle = UIAlertViewStylePlainTextInput;
    [alert show];
    
    ALDirectionsViewController *directions = [[ALDirectionsViewController alloc]init];
     [self.navigationController pushViewController:directions animated:YES];
    
    MKPlacemark *source = [[MKPlacemark   alloc]initWithCoordinate:CLLocationCoordinate2DMake(42.556559, -83.161440)   addressDictionary:[NSDictionary dictionaryWithObjectsAndKeys:@"",@"", nil] ];
    MKMapItem *srcMapItem = [[MKMapItem alloc]initWithPlacemark:source];
    [srcMapItem setName:@""];
    
    MKPlacemark *destination = [[MKPlacemark alloc]initWithCoordinate:CLLocationCoordinate2DMake(43.507774,-86.364268) addressDictionary:[NSDictionary dictionaryWithObjectsAndKeys:@"",@"", nil] ];
    
    MKMapItem *distMapItem = [[MKMapItem alloc]initWithPlacemark:destination];
    [distMapItem setName:@""];
    
    MKDirectionsRequest *request = [[MKDirectionsRequest alloc]init];
    [request setSource:srcMapItem];
    [request setDestination:distMapItem];
    [request setTransportType:MKDirectionsTransportTypeWalking];
    
    MKDirections *direction = [[MKDirections alloc]initWithRequest:request];
    
    [direction calculateDirectionsWithCompletionHandler:^(MKDirectionsResponse *response, NSError *error) {
        
        NSLog(@"response = %@",response);
        NSArray *arrRoutes = [response routes];
        [arrRoutes enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            
            MKRoute *rout = obj;
            
            MKPolyline *line = [rout polyline];
            [self.mapview addOverlay:line];
            NSLog(@"Rout Name : %@",rout.name);
            NSLog(@"Total Distance (in Meters) :%f",rout.distance);
            
            NSArray *steps = [rout steps];
            
            NSLog(@"Total Steps : %d",[steps count]);
            
            [steps enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
                NSLog(@"Rout Instruction : %@",[obj instructions]);
                NSLog(@"Rout Distance : %f",[obj distance]);
            }];
        }];
    }];
}

- (IBAction)centerLakeOnMap:(id)sender {
    
    
    MKCoordinateRegion region = { {0.0, 0.0}, {0.0, 0.0} };
    region.center.latitude = 43.507774;
    region.center.longitude = -86.364268;
    region.span.longitudeDelta = 0.01f;
    region.span.latitudeDelta = 0.01f;
    [mapview setRegion:region animated:YES];
    
    
    ALMapPin *ann = [[ALMapPin alloc]init];
    ann.title = @"Lucky Lake Campground";
    //ann.subtitle = @"New York";
    ann.coordinate = region.center;
    [mapview addAnnotation:ann];

    
//    [self.mapview addAnnotation:newAnnotation];
//    [self.mapview setRegion:region animated:TRUE];
//    [self.mapview regionThatFits:region];
    
    
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    NSLog(@"Entered: %@",[[alertView textFieldAtIndex:0] text]);
    
    ALDirectionsViewController *directions = [[ALDirectionsViewController alloc]init];
    directions.address = [[alertView textFieldAtIndex:0]text]; 
       
}


@end
