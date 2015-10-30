//
//  Tasks+CoreDataProperties.h
//  SchoolTrack
//
//  Created by David Flake on 10/27/15.
//  Copyright © 2015 DevMountain. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Tasks.h"

NS_ASSUME_NONNULL_BEGIN

@interface Tasks (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *taskName;
@property (nullable, nonatomic, retain) NSString *taskDetail;
@property (nullable, nonatomic, retain) NSDate *taskDueDate;
@property (nullable, nonatomic, retain) NSDate *taskAlertDate;
@property (nullable, nonatomic, retain) NSDate *taskAlertTime;

@end

NS_ASSUME_NONNULL_END
