//
//  TaskController.m
//  SchoolTrack
//
//  Created by David Flake on 10/20/15.
//  Copyright © 2015 DevMountain. All rights reserved.
//

#import "TaskController.h"
#import "Stack.h"

@implementation TaskController

+ (TaskController *)sharedInstance {
    static TaskController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [TaskController new];
    });
    return sharedInstance;
}

#pragma mark - Create

- (Tasks *)createTaskWithName:(NSString *)name
                      detail:(NSString *)detail
                     dueDate:(NSDate *)dueDate
                   alertDate:(NSDate *)alertDate
                   alertTime:(NSDate *)alertTime {
    
    Tasks *tasks = [NSEntityDescription insertNewObjectForEntityForName:@"Tasks" inManagedObjectContext:[Stack sharedInstance].managedObjectContext];
    tasks.taskName = name;
    tasks.taskDetail = detail;
    tasks.taskDueDate = dueDate;
    tasks.taskAlertDate = alertDate;
    tasks.taskAlertTime = alertTime;
    
    [self saveToPersistentStorage];
    
    return tasks;
}

#pragma mark - Read

- (NSArray *)tasks {
    
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"Task"];
    
    NSArray *fetchedObjects = [[Stack sharedInstance].managedObjectContext executeFetchRequest:fetchRequest error:nil];
    
    return fetchedObjects;
}

#pragma mark - Update

- (void)saveToPersistentStorage {
    [[Stack sharedInstance].managedObjectContext save:nil];
}

#pragma mark - Delete

- (void)removeTask:(Tasks *)task {
    [task.managedObjectContext deleteObject:task];
}
@end
