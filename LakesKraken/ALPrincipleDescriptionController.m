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
    
    self.view.backgroundColor = [UIColor colorWithRed:1 green:0.937 blue:0.78 alpha:1];
    [self textViewDidChange:self.descripText];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


-(void)grabDescription {
    
    if ([self.princName isEqualToString: @"Radical Inclusion"]) {
        self.descripText.text = @"Anyone may be a part of Lakes of Fire. We welcome and respect the stranger. No prerequisites exist for participation in our community."; }
    if ([self.princName isEqualToString: @"Radical Self-Reliance"]) {
        self.descripText.text = @"Lakes of Fire encourages the individual to discover, exercise and rely on his or her inner resources."; }
    if ([self.princName isEqualToString: @"Gifting"]) {
        self.descripText.text = @"Lakes of Fire is devoted to acts of gift giving. The value of a gift is unconditional. Gifting does not contemplate a return or an exchange for something of equal value."; }
    if ([self.princName isEqualToString: @"Decommodification"]) {
        self.descripText.text = @"In order to preserve the spirit of gifting, our community seeks to create social environments that are unmediated by commercial sponsorships, transactions, or advertising. We stand ready to protect our culture from such exploitation. We resist the substitution of consumption for participatory experience."; }
    if ([self.princName isEqualToString: @"Radical Self-Expression"]) {
        self.descripText.text = @"Radical self-expression arises from the unique gifts of the individual. No one other than the individual or a collaborating group can determine its content. It is offered as a gift to others. In this spirit, the giver should respect the rights and liberties of the recipient."; }
    if ([self.princName isEqualToString: @"Communal Effort"]) {
        self.descripText.text = @"Our community values creative cooperation and collaboration. We strive to produce, promote and protect social networks, public spaces, works of art, and methods of communication that support such interaction."; }
    if ([self.princName isEqualToString: @"Civic Responsibility"]) {
        self.descripText.text = @"We value civil society. Community members who organize events should assume responsibility for public welfare and endeavor to communicate civic responsibilities to participants. They must also assume responsibility for conducting events in accordance with local, state and federal laws."; }
    if ([self.princName isEqualToString: @"Leave No Trace"]) {
        self.descripText.text = @"Our community respects the environment. We are committed to leaving no physical trace of our activities wherever we gather. We clean up after ourselves and endeavor, whenever possible, to leave such places in a better state than when we found them."; }
    
    if ([self.princName isEqualToString: @"Participation"]) {
        self.descripText.text = @"Our community is committed to a radically participatory ethic. We believe that transformative change, whether in the individual or in society, can occur only through the medium of deeply personal participation. We achieve being through doing. Everyone is invited to work. Everyone is invited to play. We make the world real through actions that open the heart."; }
    if ([self.princName isEqualToString: @"Immediacy"]) {
        self.descripText.text = @"Immediate experience is, in many ways, the most important touchstone of value in our culture. We seek to overcome barriers that stand between us and a recognition of our inner selves, the reality of those around us, participation in society, and contact with a natural world exceeding human powers. No idea can substitute for this experience."; }
    
}

- (void)textViewDidChange:(UITextView *)textView
{
    CGFloat fixedWidth = textView.frame.size.width;
    CGSize newSize = [textView sizeThatFits:CGSizeMake(fixedWidth, MAXFLOAT)];
    CGRect newFrame = textView.frame;
    newFrame.size = CGSizeMake(fmaxf(newSize.width, fixedWidth), newSize.height);
    textView.frame = newFrame;
}

@end
