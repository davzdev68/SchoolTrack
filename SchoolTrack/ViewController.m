//
//  ViewController.m
//  SchoolTrack
//
//  Created by David Flake on 10/17/15.
//  Copyright © 2015 DevMountain. All rights reserved.
//

#import "ViewController.h"
#import "AddTaskTableViewController.h"
#import "AddEventTableViewController.h"

@interface ViewController ()

@property (strong, nonatomic)NSString *base;
@property(nonatomic, retain) UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"Task"]) {
        AddTaskTableViewController *controller = (AddTaskTableViewController *)segue.destinationViewController;
        controller.didSave = ^{
            // Save task?
            [self.navigationController popViewControllerAnimated:YES];
            [self.tableView reloadData];
        };
    }
    
    if ([segue.identifier isEqualToString:@"Event"]) {
        AddEventTableViewController *controller = (AddEventTableViewController *)segue.destinationViewController;
        controller.didSave = ^{
            // Save event?
            [self.navigationController popViewControllerAnimated:YES];
            [self.tableView reloadData];
        };
    }
}
@end
