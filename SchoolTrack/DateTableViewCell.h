//
//  DateTableViewCell.h
//  SchoolTrack
//
//  Created by David Flake on 11/11/15.
//  Copyright © 2015 DevMountain. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Tasks.h"
#import "Events.h"

@class DateTableViewCell;

@protocol DateTableViewCellDelegate

- (void)dateCell:(DateTableViewCell *)cell datePickerDidChange:(UIDatePicker *)picker;

@end

@interface DateTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateDetail;
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;

@property (weak, nonatomic)id<DateTableViewCellDelegate> delegate;
//@property(nonatomic) CGFloat rowHeight;

- (void)updateTaskCell: (Tasks *)task;
- (void)updateEventCell: (Events *)event;

@end
