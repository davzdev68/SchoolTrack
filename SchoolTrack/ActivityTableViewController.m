//
//  ActivityTableViewController.m
//  SchoolTrack
//
//  Created by David Flake on 11/6/15.
//  Copyright © 2015 DevMountain. All rights reserved.
//

#import "ActivityTableViewController.h"
#import "TaskController.h"
#import "EventController.h"
#import "LeftButtonTableViewCell.h"


@interface ActivityTableViewController ()

@property (nonatomic, strong) NSArray *eventsAndAssignments;

@end

@implementation ActivityTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    [self setUpCombinedData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setUpCombinedData {
    NSArray *tempArray = [NSArray arrayWithArray:[TaskController sharedInstance].tasks];
    self.eventsAndAssignments = [tempArray arrayByAddingObjectsFromArray:[EventController sharedInstance].events];
//    self.eventsAndAssignments = [tempArray sortedArrayUsingDescriptors:@[[NSSortDescriptor sortDescriptorWithKey:@"date" ascending:NO]]];
}

#pragma mark - Left Button Cell Delegate

- (void)buttonWasTapped:(id)sender {
    
    NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
    
    Tasks *tappedTask = [TaskController sharedInstance].tasks[indexPath.row];
    
    tappedTask.isComplete = !tappedTask.isComplete;
    
    [self.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
}


#pragma mark - Table view data source

//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Incomplete implementation, return the number of sections
//    return 0;
//}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
//    return [TaskController sharedInstance].tasks.count;
//    return [EventController sharedInstance].events.count;
    return self.eventsAndAssignments.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    LeftButtonTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"activityCell" forIndexPath:indexPath];
    
//    LeftButtonTableViewCell *eventCell = [tableView dequeueReusableCellWithIdentifier:@"eventsCell" forIndexPath:indexPath];
    
    // Configure the cell...
    
    id activity = self.eventsAndAssignments[indexPath.row];
    
    if ([activity isKindOfClass:[Tasks class]]) {
        Tasks *task = activity;
        cell.activityLabel.text = task.taskName;
        [[TaskController sharedInstance] updateCell:cell WithTask:task];
    } else if ([activity isKindOfClass:[Events class]]) {
        Events *event = activity;
        cell.activityLabel.text = event.eventName;
        [[EventController sharedInstance] updateCell:cell WithEvent:event];
    }

    return cell;
}

//- [TaskController (LeftButtonTableViewCell *)updateCell:(LeftButtonTableViewCell *)cell WithTask:(Tasks *)task];
//
//
//- [EventController (LeftButtonTableViewCell *)updateCell:(LeftButtonTableViewCell *)cell WithEvent:(Events *)event];

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
