//
//  ALParseQuery.h
//  LakesKraken
//
//  Created by DetroitLabsUser on 7/21/14.
//  Copyright (c) 2014 DetroitLabsUser. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ALSearchScheduleViewController.h"
#import "ALEvent.h"
#import "ALFilterEvent.h"

@interface ALParseQuery : NSObject

-(NSArray*)parseTesting:(ALFilterEvent *)filterEvent;
@end
