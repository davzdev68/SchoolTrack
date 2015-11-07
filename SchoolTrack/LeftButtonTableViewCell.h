//
//  LeftButtonTableViewCell.h
//  SchoolTrack
//
//  Created by David Flake on 11/7/15.
//  Copyright © 2015 DevMountain. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol LeftButtonTableViewCellDelegate

- (void)buttonWasTapped:(id)sender;

@end

@interface LeftButtonTableViewCell : UITableViewCell

@property (weak, nonatomic)id<LeftButtonTableViewCellDelegate> delegate;

- (void)updateWithTask:(Task *)task;

@end
