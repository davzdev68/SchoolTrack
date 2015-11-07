//
//  LeftButtonTableViewCell.h
//  SchoolTrack
//
//  Created by David Flake on 11/7/15.
//  Copyright © 2015 DevMountain. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Tasks.h"
#import "Events.h"

@protocol LeftButtonTableViewCellDelegate

- (void)buttonWasTapped:(id)sender;

@end

@interface LeftButtonTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIButton *activityButton;
@property (weak, nonatomic) IBOutlet UIImageView *activityImage;
@property (weak, nonatomic) IBOutlet UILabel *activityLabel;

@property (weak, nonatomic)id<LeftButtonTableViewCellDelegate> delegate;



@end
