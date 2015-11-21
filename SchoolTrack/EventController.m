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
    
    Events *sampleEvent4 = [Events new];
    sampleEvent4.eventName = @"Bring in the garbage can";
    sampleEvent4.isComplete = NO;
    
    Events *sampleEvent5 = [Events new];
    sampleEvent5.eventName = @"Send another check";
    sampleEvent5.isComplete = YES;
    
    Events *sampleEvent6 = [Events new];
    sampleEvent6.eventName = @"Call Dad";
    sampleEvent6.isComplete = NO;
    
    Events *sampleEvent7 = [Events new];
    sampleEvent7.eventName = @"Send another check";
    sampleEvent7.isComplete = YES;
    
    Events *sampleEvent8 = [Events new];
    sampleEvent8.eventName = @"Call Dad";
    sampleEvent8.isComplete = NO;
    
    [self.events addObjectsFromArray:@[sampleEvent1, sampleEvent2, sampleEvent3, sampleEvent4, sampleEvent5, sampleEvent6, sampleEvent7, sampleEvent8]];
    
}


@end
