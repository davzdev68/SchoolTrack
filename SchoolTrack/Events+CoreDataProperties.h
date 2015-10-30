//
//  Events+CoreDataProperties.h
//  SchoolTrack
//
//  Created by David Flake on 10/27/15.
//  Copyright © 2015 DevMountain. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Events.h"

NS_ASSUME_NONNULL_BEGIN

@interface Events (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *eventName;
@property (nullable, nonatomic, retain) NSString *eventDetail;
@property (nullable, nonatomic, retain) NSDate *eventDate;
@property (nullable, nonatomic, retain) NSDate *eventStartTime;
@property (nullable, nonatomic, retain) NSDate *eventEndTime;
@property (nullable, nonatomic, retain) NSDate *eventAlertDate;
@property (nullable, nonatomic, retain) NSDate *eventAlertTime;

@end

NS_ASSUME_NONNULL_END
