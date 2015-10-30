//
//  EventController.m
//  SchoolTrack
//
//  Created by David Flake on 10/20/15.
//  Copyright © 2015 DevMountain. All rights reserved.
//

#import "EventController.h"
#import "Stack.h"

@implementation EventController

+ (EventController *)sharedInstance {
    static EventController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [EventController new];
    });
    return sharedInstance;
}

#pragma mark - Create

- (Events *)createEventWithName:(NSString *)name
                         detail:(NSString *)detail
                        dueDate:(NSDate *)date
                      startTime:(NSDate *)startTime
                        endTime:(NSDate *)endTime
                      alertDate:(NSDate *)alertDate
                      alertTime:(NSDate *)alertTime {
    
    Events *events = [NSEntityDescription insertNewObjectForEntityForName:@"Events" inManagedObjectContext:[Stack sharedInstance].managedObjectContext];
    events.eventName = name;
    events.eventDetail = detail;
    events.eventDate = date;
    events.eventAlertDate = alertDate;
    events.eventAlertTime = alertTime;
    
    [self saveToPersistentStorage];
    
    return events;
}

#pragma mark - Read

- (NSArray *)events {
    
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"Task"];
    
    NSArray *fetchedObjects = [[Stack sharedInstance].managedObjectContext executeFetchRequest:fetchRequest error:nil];
    
    return fetchedObjects;
}

#pragma mark - Update

- (void)saveToPersistentStorage {
    [[Stack sharedInstance].managedObjectContext save:nil];
}

#pragma mark - Delete

- (void)removeEvent:(Events *)event {
    [event.managedObjectContext deleteObject:event];
}
@end
