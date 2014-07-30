//
//  ALParseQuery.h
//  LakesKraken
//
//  Created by DetroitLabsUser on 7/21/14.
//  Copyright (c) 2014 DetroitLabsUser. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ALSearchResultsViewController.h"
#import <Parse/Parse.h>
#import "ALEvent.h"
#import "ALFilterEvent.h"


@interface ALParseQuery : NSObject

@property (nonatomic, strong) NSMutableArray *eventArray;
@property (nonatomic, retain) ALEvent *event;

typedef void(^ALParseQueryResultBlock)(NSArray *objects, NSError *error);

-(void)fetchDataFromParse:(ALFilterEvent *)filterEvent withResultBlock:(ALParseQueryResultBlock)resultBlock;

//-(NSArray*)parseTesting:(ALFilterEvent *)filterEvent;

//-(NSArray*)parse:(ALFilterEvent *)filterEvent;

-(NSArray*)fetchDataFromParse:(ALFilterEvent *)filterEvent;

@end
