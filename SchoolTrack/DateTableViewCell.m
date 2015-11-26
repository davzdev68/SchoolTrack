//
//  DateTableViewCell.m
//  SchoolTrack
//
//  Created by David Flake on 11/11/15.
//  Copyright © 2015 DevMountain. All rights reserved.
//

#import "DateTableViewCell.h"
#import "Tasks.h"

@implementation DateTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (IBAction)datePickerChanged:(UIDatePicker *)sender {
    NSLog(@"Date picker changed: %@", self.datePicker.date);
    [self.delegate dateCell:self datePickerDidChange:self.datePicker];
}



- (void)updateTaskCell: (Tasks *)task {

}

- (void)updateEventCell: (Events *)event {

}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
