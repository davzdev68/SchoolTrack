//
//  AddTaskTableViewController.m
//  SchoolTrack
//
//  Created by David Flake on 11/11/15.
//  Copyright © 2015 DevMountain. All rights reserved.
//

#import "AddTaskTableViewController.h"
#import "NameTableViewCell.h"
#import "DescriptionTableViewCell.h"
#import "DateTableViewCell.h"

@interface AddTaskTableViewController ()

@end

@implementation AddTaskTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 4;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    switch (indexPath.row) {
        case 0:
            return [self nameCell];
            break;
        case 1:
            return [self descrCell];
        case 2:
            return [self dateCell];
        case 3:
            return [self dateCell];
        default:
            return nil;
            break;
    }
}

-(NameTableViewCell *)nameCell {
    NameTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"taskCell"];
    return cell;
}

-(DescriptionTableViewCell *)descrCell {
    DescriptionTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"descrCell"];
    return cell;
}

-(DateTableViewCell *)dateCell {
    DateTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"dateCell"];
    return cell;
}

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
