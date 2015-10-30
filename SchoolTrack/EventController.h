//
//  EventController.h
//  SchoolTrack
//
//  Created by David Flake on 10/20/15.
//  Copyright © 2015 DevMountain. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Events.h"

@interface EventController : NSObject

@property (strong, nonatomic, readonly) NSArray *events;

+ (EventController *)sharedInstance;

- (Events *)createEventWithName:(NSString *)name
                         detail:(NSString *)detail
                        dueDate:(NSDate *)date
                      startTime:(NSDate *)startTime
                        endTime:(NSDate *)endTime
                      alertDate:(NSDate *)alertDate
                      alertTime:(NSDate *)alertTime;

- (void)saveToPersistentStorage;

- (void)removeEvent:(Events *)event;

@end
