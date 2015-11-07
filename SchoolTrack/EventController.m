//
//  EventController.m
//  SchoolTrack
//
//  Created by David Flake on 10/20/15.
//  Copyright © 2015 DevMountain. All rights reserved.
//

#import "EventController.h"
#import "Events.h"

@implementation EventController

+ (EventController *)sharedInstance {
    static EventController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [EventController new];
    });
    return sharedInstance;
}

- (LeftButtonTableViewCell *)updateCell:(LeftButtonTableViewCell *)cell WithEvent:(Events *)event {
    
    cell.activityImage.image = [UIImage imageNamed:@"letter_e_blue_96961.jpg"];
    
    if (event.isComplete) {
        cell.activityButton.imageView.image = [UIImage imageNamed:@"complete_360"];
    } else {
        cell.activityButton.imageView.image = [UIImage imageNamed:@"incomplete_360"];
    }
    
    return cell;
}

-(NSMutableArray *)events {
    
    Events *event = [Events new];
    
    event.eventName = @"My First Event";
    event.isComplete = YES;
    
    NSMutableArray *events = @[event];
    
    return events;
}

@end
