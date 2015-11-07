//
//  TaskController.m
//  SchoolTrack
//
//  Created by David Flake on 10/20/15.
//  Copyright © 2015 DevMountain. All rights reserved.
//

#import "TaskController.h"
#import "Tasks.h"

@interface TaskController()

@property (strong, nonatomic) NSMutableArray *tasks;

@end

@implementation TaskController

+ (TaskController *)sharedInstance {
    static TaskController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [TaskController new];
        
        sharedInstance.tasks = [NSMutableArray new];
        [sharedInstance setUpMockData];
    });
    return sharedInstance;
}

- (LeftButtonTableViewCell *)updateCell:(LeftButtonTableViewCell *)cell WithTask:(Tasks *)task {
    
    if (task.isComplete) {
        cell.activityButton.imageView.image = [UIImage imageNamed:@"complete_360"];
    } else {
        cell.activityButton.imageView.image = [UIImage imageNamed:@"incomplete_360"];
    }
    
    return cell;
}

- (void)setUpMockData {

    Tasks *sampleTask1 = [Tasks new];
    sampleTask1.taskName = @"Take out garbage";
    sampleTask1.isComplete = NO;

    Tasks *sampleTask2 = [Tasks new];
    sampleTask2.taskName = @"Sent check for rent";
    sampleTask2.isComplete = YES;

    Tasks *sampleTask3 = [Tasks new];
    sampleTask3.taskName = @"Call Mom";
    sampleTask3.isComplete = NO;

    [self.tasks addObjectsFromArray:@[sampleTask1, sampleTask2, sampleTask3]];

}

//+ (TaskController *)sharedInstance {
//    static TaskController *sharedInstance = nil;
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//        sharedInstance = [TaskController new];
//        
//        sharedInstance.tasks = [NSMutableArray new];
//        [sharedInstance setUpMockData];
//        
//    });
//    return sharedInstance;
//}
//
//- (void)addTask:(Tasks *)task {
//    
//    [self.tasks addObject:task];
//}
//
//- (void)removeTask:(Tasks *)task{
//    [self.tasks removeObject:task];
//    
//}
//
//- (void)updateTask:(Tasks *)task {
//    
//}
//
//- (void)setUpMockData {
//    
//    Task *sampleTask1 = [Task new];
//    sampleTask1.name = @"Take out garbage";
//    sampleTask1.isComplete = NO;
//    
//    Task *sampleTask2 = [Task new];
//    sampleTask2.name = @"Sent check for rent";
//    sampleTask2.isComplete = NO;
//    
//    Task *sampleTask3 = [Task new];
//    sampleTask3.name = @"Call Mom";
//    sampleTask3.isComplete = NO;
//    
//    [self.tasks addObjectsFromArray:@[sampleTask1, sampleTask2, sampleTask3]];
//    
//    
//}

//- (void)updateWithTask:(Tasks *)task {
//    
//    self.activityLabel.text = task.taskName;
//    
//    if (task.isComplete) {
//        self.activityButton.imageView.image = [UIImage imageNamed:@"complete_360"];
//    } else {
//        self.activityButton.imageView.image = [UIImage imageNamed:@"incomplete_360"];
//    }
//}

@end
