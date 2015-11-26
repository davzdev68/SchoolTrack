//
//  AddEventTableViewController.m
//  SchoolTrack
//
//  Created by David Flake on 11/11/15.
//  Copyright © 2015 DevMountain. All rights reserved.
//

#import "AddEventTableViewController.h"
#import "NameTableViewCell.h"
#import "DescriptionTableViewCell.h"
#import "DateTableViewCell.h"
#import "LeftButtonTableViewCell.h"

@interface AddEventTableViewController () <DateTableViewCellDelegate>

@property (nonatomic, assign) NSInteger currentDateCellIndex;

@end

@implementation AddEventTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.currentDateCellIndex = -1;
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)saveTapped:(id)sender {
    if (self.didSave) {
        // Save event?
        self.didSave();
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSInteger expandedDateRowHeight = 250;
    NSInteger collapsedDateRowHeight = 46;
    
    if (indexPath.row == 0) {
        return 72;
    } else if (indexPath.row == 1){
        return 115;
    } else if (indexPath.row == 2){
        if (self.currentDateCellIndex == 2) {
            return expandedDateRowHeight;
        } else {
            return collapsedDateRowHeight;
        }
    } else if (indexPath.row == 3){
        if (self.currentDateCellIndex == 3) {
            return expandedDateRowHeight;
        } else {
            return collapsedDateRowHeight;
        }
    } else if (indexPath.row == 4){
        if (self.currentDateCellIndex == 4) {
            return expandedDateRowHeight;
        } else {
            return collapsedDateRowHeight;
        }
    } else if (indexPath.row == 5){
        if (self.currentDateCellIndex == 5) {
            return expandedDateRowHeight;
        } else {
            return collapsedDateRowHeight;
        }
    } else {
        return 46;
    }
    
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 6;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSLog(@"%@", @(indexPath.row));
    
    switch (indexPath.row) {
        case 0:
            
            return [self nameCell];
            break;
            
        case 1:
            
            return [self descrCell];
            break;
            
        case 2: {
            
            DateTableViewCell *cell = [self dateCell];
            cell.datePicker.datePickerMode = UIDatePickerModeDate;
            cell.dateLabel.text = @"Event Date";
            
            return cell;
        }
        case 3:{
            
            DateTableViewCell *cell = [self dateCell];
            cell.dateLabel.text = @"Start Time";
//            NSDate *date = magicCoreDataCallToGetDate();
//            [cell.datePicker setDate:date animated:YES];
//            cell.dateDetail.text = @"The formatted date";
            
            return cell;
        }
        case 4:{
            
            DateTableViewCell *cell = [self dateCell];
            cell.dateLabel.text = @"End Time";
            
            return cell;
        }
        case 5:{
            
            DateTableViewCell *cell = [self dateCell];
            cell.dateLabel.text = @"Alert";
            
            return cell;
        }
        default:
            return nil;
            break;
    }
}

- (NameTableViewCell *)nameCell {
    NameTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"nameCell"];
    return cell;
}

- (DescriptionTableViewCell *)descrCell {
    DescriptionTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"descrCell"];
    
    return cell;
}

- (DateTableViewCell *)dateCell {
    DateTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"dateCell"];
    cell.delegate = self;
    //    cell.eventDate = self.event.name;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row > 1) {
        if (indexPath.row == self.currentDateCellIndex) {
            self.currentDateCellIndex = -1;
        } else {
            self.currentDateCellIndex = indexPath.row;
        }
        [self.tableView beginUpdates];
        [self.tableView endUpdates];
    }
}

-(void)dateCell:(DateTableViewCell *)cell datePickerDidChange:(UIDatePicker *)picker {
    NSIndexPath *indexPath = [self.tableView indexPathForCell:cell];
    NSLog(@"Date picker changed for row: %@", @(indexPath.row));
    // TODO: Save in CoreData and reload table view
//    picker.date;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}


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
