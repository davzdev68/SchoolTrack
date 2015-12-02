//
//  LeftButtonTableViewCell.m
//  SchoolTrack
//
//  Created by David Flake on 11/7/15.
//  Copyright © 2015 DevMountain. All rights reserved.
//

#import "LeftButtonTableViewCell.h"

@interface LeftButtonTableViewCell ()

@end
@implementation LeftButtonTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (IBAction)leftButtonTapped:(id)sender {
    
    [self.delegate buttonWasTapped:self];

}

- (void)updateTaskCell: (Tasks *)task {
    
    self.activityImage.image = [UIImage imageNamed:@"letter_a_orange_96926.jpg"];
    
    if (task.isComplete) {
        self.activityButton.imageView.image = [UIImage imageNamed:@"complete_360"];
        
        NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:self.activityLabel.text];
        [string addAttribute:NSStrikethroughStyleAttributeName value:@2 range:NSMakeRange(0, [string length])];
        
        self.activityLabel.attributedText = string;
        
    } else {
        self.activityButton.imageView.image = [UIImage imageNamed:@"incomplete_360"];
    }
    
    //    return cell;
}

- (void)updateEventCell: (Events *)event {
    
    self.activityImage.image = [UIImage imageNamed:@"letter_e_blue_96961.jpg"];
    
    if (event.isComplete) {
        self.activityButton.imageView.image = [UIImage imageNamed:@"complete_360"];
        
        NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:self.activityLabel.text];
        [string addAttribute:NSStrikethroughStyleAttributeName value:@2 range:NSMakeRange(0, [string length])];
        
        self.activityLabel.attributedText = string;
        
    } else {
        self.activityButton.imageView.image = [UIImage imageNamed:@"incomplete_360"];
    }
    
//    return cell;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
