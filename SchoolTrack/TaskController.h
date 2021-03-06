//
//  TaskController.h
//  SchoolTrack
//
//  Created by David Flake on 10/20/15.
//  Copyright © 2015 DevMountain. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Tasks.h"
#import "LeftButtonTableViewCell.h"

@interface TaskController : NSObject

@property (strong, nonatomic, readonly) NSMutableArray *tasks;

+ (TaskController *)sharedInstance;

- (void)removeTask:(Tasks *)tasks;


//- (void)addTask:(Tasks *)task;
//- (void)removeTask:(Tasks *)task;
//- (void)updateTask:(Tasks *)task;
//- (void)updateWithTask:(Tasks *)task;

@end
