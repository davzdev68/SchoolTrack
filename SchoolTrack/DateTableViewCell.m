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
    
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    
    if ([self.dateLabel.text isEqual: @"Due Date"]) {
        [dateFormatter setDateStyle:NSDateFormatterShortStyle];
        [dateFormatter setTimeStyle:NSDateFormatterNoStyle];

    }else{
        [dateFormatter setDateStyle:NSDateFormatterShortStyle];
        [dateFormatter setTimeStyle:NSDateFormatterShortStyle];
    };
    
    NSString *formattedDateString = [dateFormatter stringFromDate:self.datePicker.date];
    NSLog(@"formattedDateString: %@", formattedDateString);

    self.dateDetail.text = [NSString stringWithFormat:@"%@", formattedDateString];
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
