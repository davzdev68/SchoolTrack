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
    
    Tasks *sampleTask4 = [Tasks new];
    sampleTask4.taskName = @"Take out garbage";
    sampleTask4.isComplete = NO;
    
    Tasks *sampleTask5 = [Tasks new];
    sampleTask5.taskName = @"Sent check for rent";
    sampleTask5.isComplete = YES;
    
    Tasks *sampleTask6 = [Tasks new];
    sampleTask6.taskName = @"Call Mom";
    sampleTask6.isComplete = NO;
    
    Tasks *sampleTask7 = [Tasks new];
    sampleTask7.taskName = @"Sent check for rent";
    sampleTask7.isComplete = YES;
    
    Tasks *sampleTask8 = [Tasks new];
    sampleTask8.taskName = @"Call Mom";
    sampleTask8.isComplete = NO;

    [self.tasks addObjectsFromArray:@[sampleTask1, sampleTask2, sampleTask3, sampleTask4, sampleTask5, sampleTask6, sampleTask7, sampleTask8]];

}




//- (void)addTask:(Tasks *)task {
//    
//    [self.tasks addObject:task];
//}

//- (void)removeTask:(Tasks *)task{
//    [self.tasks removeObject:task];
//    
//}
//
//- (void)updateTask:(Tasks *)task {
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
