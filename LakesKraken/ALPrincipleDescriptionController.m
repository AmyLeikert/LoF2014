//
//  ALPrincipleDescriptionController.m
//  LakesKraken
//
//  Created by Leikert, Amy on 11/21/14.
//  Copyright (c) 2014 DetroitLabsUser. All rights reserved.
//

#import "ALPrincipleDescriptionController.h"

@interface ALPrincipleDescriptionController ()

@end

@implementation ALPrincipleDescriptionController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.nameLabel setText:self.princName];
    
    [self grabDescription];

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

-(void)grabDescription {
    
    if ([self.princName isEqualToString: @"Radical Inclusion"]) {
        self.descripText.text = @"Anyone may be a part of Lakes of Fire. We welcome and respect the stranger. No prerequisites exist for participation in our community."; }
    if ([self.princName isEqualToString: @"Radical Self-Reliance"]) {
        self.descripText.text = @"Lakes of Fire encourages the individual to discover, exercise and rely on his or her inner resources."; }
    
}

@end
