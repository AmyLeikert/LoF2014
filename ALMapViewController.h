//
//  ALMapViewController.h
//  LakesKraken
//
//  Created by Leikert, Amy on 11/17/14.
//  Copyright (c) 2014 DetroitLabsUser. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface ALMapViewController : UIViewController {
    MKMapView *mapview;
}
@property (nonatomic, retain) IBOutlet MKMapView *mapview;
@property (nonatomic, strong) IBOutlet UIButton *locationButton;

-(IBAction)setMapView:(id)sender;

-(IBAction)GetLocation:(id)sender;

@end
