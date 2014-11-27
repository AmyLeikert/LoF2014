//
//  ALDirectionsViewController.m
//  LakesKraken
//
//  Created by Leikert, Amy on 11/21/14.
//  Copyright (c) 2014 DetroitLabsUser. All rights reserved.
//

#import "ALDirectionsViewController.h"

@interface ALDirectionsViewController ()

@end

@implementation ALDirectionsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.fromLabel setText:self.address];
    
    [self.table registerClass: [UITableViewCell class] forCellReuseIdentifier:@"cellReuseIdentifier"];
    
    self.view.backgroundColor = [UIColor colorWithRed:1 green:0.937 blue:0.78 alpha:1];
    self.table.backgroundColor = [UIColor colorWithRed:1 green:0.937 blue:0.78 alpha:1];
    
    [self getDirections];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.steps.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellReuseIdentifier" forIndexPath:indexPath];
    
    if (!cell) {
        cell = [tableView dequeueReusableCellWithIdentifier:@"cellReuseIdentifier"];
    }
    
    [cell setBackgroundColor:[UIColor clearColor]];
    cell.textLabel.textAlignment = UITextAlignmentCenter;
    
    cell.textLabel.font = [UIFont fontWithName:@"AmericanTypewriter" size:16];
    
    return cell;
    
}

-(void)getDirections {
    
    CLGeocoder *geocoder = [[CLGeocoder alloc] init];
    [geocoder geocodeAddressString:self.address completionHandler:^(NSArray *placemarks, NSError *error) {
        if (error) {
            NSLog(@"%@", error);
        } else {
            CLPlacemark *clplacemark = [placemarks lastObject];
            MKPlacemark *source = [[MKPlacemark alloc] initWithPlacemark:clplacemark];
            
            //      MKPlacemark *source = [[MKPlacemark   alloc]initWithCoordinate:CLLocationCoordinate2DMake(42.556559, -83.161440)   addressDictionary:[NSDictionary dictionaryWithObjectsAndKeys:@"",@"", nil] ];
            MKMapItem *srcMapItem = [[MKMapItem alloc]initWithPlacemark:source];
            [srcMapItem setName:@"Home"];
            
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
                 //   [self.mapview addOverlay:line];
                    NSLog(@"Rout Name : %@",rout.name);
                    NSLog(@"Total Distance (in Meters) :%f",rout.distance);
                    
                    NSArray *steps = [rout steps];
                    self.steps = [rout steps];
                    
                    NSLog(@"Total Steps : %d",[steps count]);
                    
                    [steps enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
                        NSLog(@"Rout Instruction : %@",[obj instructions]);
                        NSLog(@"Rout Distance : %f",[obj distance]);
                    }];
                }];
            }];
            
            
            
            
            //            float spanX = 0.00725;
            //            float spanY = 0.00725;
            //            MKCoordinateRegion region;
            //            region.center.latitude = placemark.location.coordinate.latitude;
            //            region.center.longitude = placemark.location.coordinate.longitude;
            //            region.span = MKCoordinateSpanMake(spanX, spanY);
            //            [self.mapView setRegion:region animated:YES];
        }
    }];

    
}



@end
