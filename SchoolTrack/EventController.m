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
        
        sharedInstance.events = [NSMutableArray new];

        [sharedInstance setUpMockData2];

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

- (void)setUpMockData2 {
    
    Events *sampleEvent1 = [Events new];
    sampleEvent1.eventName = @"Bring in the garbage can";
    sampleEvent1.isComplete = NO;
    
    Events *sampleEvent2 = [Events new];
    sampleEvent2.eventName = @"Send another check";
    sampleEvent2.isComplete = YES;
    
    Events *sampleEvent3 = [Events new];
    sampleEvent3.eventName = @"Call Dad";
    sampleEvent3.isComplete = NO;
    
    [self.events addObjectsFromArray:@[sampleEvent1, sampleEvent2, sampleEvent3]];
    
}


@end
