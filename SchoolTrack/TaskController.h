//
//  TaskController.h
//  SchoolTrack
//
//  Created by David Flake on 10/20/15.
//  Copyright © 2015 DevMountain. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Tasks.h"

@interface TaskController : NSObject

@property (strong, nonatomic, readonly) NSArray *tasks;

+ (TaskController *)sharedInstance;

- (Tasks *)createTaskWithName:(NSString *)name
                      detail:(NSString *)detail
                     dueDate:(NSDate *)dueDate
                   alertDate:(NSDate *)alertDate
                   alertTime:(NSDate *)alertTime;

- (void)saveToPersistentStorage;

- (void)removeTask:(Tasks *)task;

@end
