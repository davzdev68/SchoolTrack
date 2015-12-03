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
#import "AddTaskTableViewController.h"
#import "AddEventTableViewController.h"
#import "TaskController.h"
#import "EventController.h"


@interface ActivityTableViewController ()<
LeftButtonTableViewCellDelegate>

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

- (void)viewWillAppear:(BOOL)animated {
    
    [self.tableView reloadData];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setUpCombinedData {
    NSArray *tempArray = [NSArray arrayWithArray:[TaskController sharedInstance].tasks];
    self.eventsAndAssignments = [tempArray arrayByAddingObjectsFromArray:[EventController sharedInstance].events];
    
    // Use this when core data is working.
//    self.eventsAndAssignments = [tempArray sortedArrayUsingDescriptors:@[[NSSortDescriptor sortDescriptorWithKey:@"date" ascending:NO]]];
}

#pragma mark - Left Button Cell Delegate

- (void)buttonWasTapped:(id)sender {
    
    NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];

    id activity = self.eventsAndAssignments[indexPath.row];
    
    if ([activity isKindOfClass:[Tasks class]]) {
        
        Tasks *tappedTask = [TaskController sharedInstance].tasks[indexPath.row];
        
        tappedTask.isComplete = !tappedTask.isComplete;
        
        [self.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
        
    }else if ([activity isKindOfClass:[Events class]]) {
        
        NSInteger newIndexInt = indexPath.row - [TaskController sharedInstance].tasks.count;
//        int newRow = newIndexInt intValue;
//        NSIndexPath *newIndexPath = indexPath[newRow];
//        
        Events *tappedEvent = [EventController sharedInstance].events[newIndexInt];
        
        tappedEvent.isComplete = !tappedEvent.isComplete;
        
        [self.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
    }
    
}

#pragma mark - Table view data source

//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//    // Return a new section for each header that you want. Today, tomorrow, this week etc...
//    // If there isn't any assignments for that time period don't display the section.
//    return 0;
//}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Based on what section find how many assignments fall in that time period.
    return self.eventsAndAssignments.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // In the section show the cells that belong in that time period. Which means you have to cycle through all the activities to find the ones you want.
    
    LeftButtonTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"activityCell" forIndexPath:indexPath];
    
    id activity = self.eventsAndAssignments[indexPath.row];
    
    if ([activity isKindOfClass:[Tasks class]]) {
        Tasks *task = activity;
        cell.activityLabel.text = task.taskName;
        
        cell.delegate = self;

        [cell updateTaskCell:task];
        //        [[TaskController sharedInstance] updateCell:cell WithTask:task];
    } else if ([activity isKindOfClass:[Events class]]) {
        Events *event = activity;
        cell.activityLabel.text = event.eventName;
        
        cell.delegate = self;

        [cell updateEventCell:event];
//        [[EventController sharedInstance] updateCell:cell WithEvent:event];
    }

    return cell;
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"Edit"]) {
        id activity = self.eventsAndAssignments[self.tableView.indexPathForSelectedRow.row];
        
        if ([activity isKindOfClass:[Tasks class]]) {
            // TODO
            AddTaskTableViewController *controller = (AddTaskTableViewController *)segue.destinationViewController;
            controller.didSave = ^{
                //Save event?
                [self.navigationController popViewControllerAnimated:YES];
                [self.tableView reloadData];

            };
        } else if ([activity isKindOfClass:[Events class]]) {
            AddEventTableViewController *controller = (AddEventTableViewController *)segue.destinationViewController;
            controller.didSave = ^{
                // Save event?
                [self.navigationController popViewControllerAnimated:YES];
                [self.tableView reloadData];
            };
        }
    }
}

-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

-(NSArray<UITableViewRowAction *> *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewRowAction *action = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDestructive title:@"Delete" handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
        // Delete!
        [self.tableView beginUpdates];
        id activity = self.eventsAndAssignments[self.tableView.indexPathForSelectedRow.row];
        if ([activity isKindOfClass:[Tasks class]]) {
            [[TaskController sharedInstance] removeTask:[TaskController sharedInstance].tasks[indexPath.row]];
            [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
            [self.tableView endUpdates];
        
            
        }else{
            [[EventController sharedInstance] removeEvent:[EventController sharedInstance].events[indexPath.row]];
            [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
            [self.tableView endUpdates];
        };
        
        
    }];

    return @[action];
}

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
