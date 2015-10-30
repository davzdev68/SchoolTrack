//
//  ViewController.m
//  SchoolTrack
//
//  Created by David Flake on 10/17/15.
//  Copyright © 2015 DevMountain. All rights reserved.
//

#import "ViewController.h"
#import "TaskController.h"

@interface ViewController ()

@property (strong, nonatomic)NSString *base;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[TaskController sharedInstance] createTaskWithName:@"Math Ch3 Worksheet" detail:@"Working with exponents" dueDate:[NSDate date] alertDate:[NSDate date] alertTime:[NSDate date]];
}

- (IBAction)calendarButtonTapped:(id)sender {
    
    //OPEN pop-over w/ calendar options
    
}

- (IBAction)assignmentsButtonTapped:(id)sender {
    
    //OPEN Assignments (task) list
    
}

- (IBAction)eventsButtonTapped:(id)sender {
    
    //OPEN Events list

}

- (IBAction)addTaskButtonTapped:(id)sender {
    
    //LOAD Add Assignment view
    
}

- (IBAction)addEventButtonTapped:(id)sender {
    
    //LOAD Add Event view
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
