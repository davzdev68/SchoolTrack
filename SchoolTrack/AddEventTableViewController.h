//
//  AddEventTableViewController.h
//  SchoolTrack
//
//  Created by David Flake on 11/11/15.
//  Copyright © 2015 DevMountain. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Events.h"

@interface AddEventTableViewController : UITableViewController

@property (nonatomic, copy) void (^didSave)();

@end
