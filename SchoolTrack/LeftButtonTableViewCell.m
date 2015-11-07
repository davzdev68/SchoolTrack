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


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
