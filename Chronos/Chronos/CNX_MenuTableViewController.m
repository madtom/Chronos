//
//  CNX_MenuTableViewController.m
//  Chronos
//
//  Created by Thomas Dubiel on 12.09.12.
//  Copyright (c) 2012 Thomas Dubiel. All rights reserved.
//

#import "CNX_MenuTableViewController.h"

@interface CNX_MenuTableViewController ()

@end

@implementation CNX_MenuTableViewController

@synthesize kundenTableViewController, projekteTableViewController, leistungenTableViewController, zeitenTableViewController;

-(CNX_KundenTableViewController *)kundenTableViewController {
    if (kundenTableViewController == nil) {
        kundenTableViewController = [[CNX_KundenTableViewController alloc] initWithNibName:@"CNX_KundenTableViewController" bundle:nil];
    }
    return kundenTableViewController;
}

-(CNX_ProjekteTableViewController *)projekteTableViewController {
    if (projekteTableViewController == nil) {
        projekteTableViewController = [[CNX_ProjekteTableViewController alloc] initWithNibName:@"CNX_ProjekteTableViewController" bundle:nil];
    }
    return projekteTableViewController;
}

-(CNX_LeistungenTableViewController *)leistungenTableViewController {
    if (leistungenTableViewController == nil) {
        leistungenTableViewController = [[CNX_LeistungenTableViewController alloc] initWithNibName:@"CNX_LeistungenTableViewController" bundle:nil];
    }
    return leistungenTableViewController;
}

-(CNX_ZeitenTableViewController *)zeitenTableViewController {
    if (zeitenTableViewController == nil) {
        zeitenTableViewController = [[CNX_ZeitenTableViewController alloc] initWithNibName:@"CNX_ZeitenTableViewController" bundle:nil];
    }
    return zeitenTableViewController;
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    // Configure the cell...
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    switch (indexPath.row) {
        case 0: {
            cell.textLabel.text = @"Kunden";
        } break;
        case 1: {
            cell.textLabel.text = @"Projekte";
        } break;
        case 2: {
            cell.textLabel.text = @"Leistungen";
        } break;
        case 3: {
            cell.textLabel.text = @"Zeiten";
        } break;
    }
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    UITableViewController *controller = nil;
    
    switch (indexPath.row) {
        case 0:
            controller = self.kundenTableViewController;
            break;
        case 1:
            controller = self.projekteTableViewController;
            break;
        case 2:
            controller = self.leistungenTableViewController;
            break;
        case 3:
            controller = self.zeitenTableViewController;
            break;
    }
    [self.navigationController pushViewController:controller animated:YES];

}

@end
