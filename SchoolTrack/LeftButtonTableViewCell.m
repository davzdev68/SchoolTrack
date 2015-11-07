//
//  LeftButtonTableViewCell.m
//  SchoolTrack
//
//  Created by David Flake on 11/7/15.
//  Copyright © 2015 DevMountain. All rights reserved.
//

#import "LeftButtonTableViewCell.h"
#import "Tasks.h"
#import "Events.h"

@interface LeftButtonTableViewCell ()

@property (weak, nonatomic) IBOutlet UIButton *activityButton;
@property (weak, nonatomic) IBOutlet UIImageView *activityImage;
@property (weak, nonatomic) IBOutlet UILabel *activityLabel;

@end
@implementation LeftButtonTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (IBAction)leftButtonTapped:(id)sender {
    
    [self.delegate buttonWasTapped:self];

}

- (void)updateWithTask:(Task *)task {
    
    self.activityLabel.text = task.name;
    
    if (task.isComplete) {
        self.activityButton.imageView.image = [UIImage imageNamed:@"complete_360"];
    } else {
        self.activityButton.imageView.image = [UIImage imageNamed:@"incomplete_360"];
    }
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
