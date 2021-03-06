//
//  EventController.h
//  SchoolTrack
//
//  Created by David Flake on 10/20/15.
//  Copyright © 2015 DevMountain. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Events.h"
#import "LeftButtonTableViewCell.h"

@interface EventController : NSObject

@property (strong, nonatomic, readonly) NSMutableArray *events;

+ (EventController *)sharedInstance;

- (void)removeEvent:(Events *)events;

@end
