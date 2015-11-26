//
//  Tasks.h
//  SchoolTrack
//
//  Created by David Flake on 10/20/15.
//  Copyright © 2015 DevMountain. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Tasks : NSObject

@property (strong, nonatomic)NSString * taskName;
@property (strong, nonatomic)NSString * taskDescription;
@property (strong, nonatomic)NSDate * dueDate;
@property (strong, nonatomic)NSDate * alertDate;
@property (assign, nonatomic) BOOL isComplete;
@property (assign, nonatomic) BOOL setDate;

@end
