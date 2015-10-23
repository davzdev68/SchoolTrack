//
//  Events.h
//  SchoolTrack
//
//  Created by David Flake on 10/20/15.
//  Copyright © 2015 DevMountain. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Events : NSObject

@property (strong, nonatomic)NSString * eventName;
@property (strong, nonatomic)NSString * eventDetail;
@property (strong, nonatomic)NSDate * eventDate;
@property (strong, nonatomic)NSDate * startTime;
@property (strong, nonatomic)NSDate * endTime;
@property (strong, nonatomic)NSDate * alertDate;
@property (strong, nonatomic)NSDate * alertTime;


@end
