//
//  CNX_ZeitenTableViewController.m
//  Chronos
//
//  Created by Thomas Dubiel on 12.09.12.
//  Copyright (c) 2012 Thomas Dubiel. All rights reserved.
//

#import "CNX_ZeitenTableViewController.h"

@interface CNX_ZeitenTableViewController ()

@end

@implementation CNX_ZeitenTableViewController

@synthesize fetchedResultsController, tableViewCell, dateFormatter;

-(NSFetchedResultsController *)fetchedResultsController {
    
    // Application Delegate ermitteln
    CNX_AppDelegate *appDelegate = (CNX_AppDelegate*)[[UIApplication sharedApplication] delegate];
    
    // falls vorhanden gecachte Instanz verwenden
    if (fetchedResultsController != nil) {
        return fetchedResultsController;
    }
    
    // Erzeugen eines Fetch Requests
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Zeit" inManagedObjectContext:appDelegate.managedObjectContext];
    [fetchRequest setEntity:entity];
    
    // Erzeugen eines SortDescriptors für den fetch Request
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"datum" ascending:YES];
    NSArray *sortDescriptors = [[NSArray alloc] initWithObjects:sortDescriptor, nil];
    [fetchRequest setSortDescriptors:sortDescriptors];
    
    // Erzeugen eines Fetched Request Controllers mit Hilfe des Fetch Request
    NSFetchedResultsController *aFetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest managedObjectContext:appDelegate.managedObjectContext sectionNameKeyPath:nil cacheName:@"Root"];
    self.fetchedResultsController = aFetchedResultsController;
    
    return fetchedResultsController;
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
    
    NSError *error;
    if (![[self fetchedResultsController] performFetch:&error]) {
        NSLog(@"Error during performFetch in KundenTableViewController");
        NSLog(@"%@", [error localizedDescription]);
    }
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
    return [[fetchedResultsController fetchedObjects] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *MyIdentifier = @"ZeitenListeCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
    if (cell == nil) {
        [[NSBundle mainBundle] loadNibNamed:@"ZeitenTableViewCell" owner:self options:nil];
        cell = tableViewCell;
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        self.tableViewCell = nil;
    }
    
    // Configure the cell...
    Zeit *zeit = (Zeit *)[fetchedResultsController objectAtIndexPath:indexPath];
    
    UILabel *label;
    label = (UILabel *)[cell viewWithTag:1];
    label.text = [dateFormatter stringFromDate:zeit.datum];
    
    label = (UILabel *)[cell viewWithTag:2];
    label.text = [zeit.dauer stringValue];
    
    if (zeit.projekt != nil) {
        label = (UILabel *)[cell viewWithTag:3];
        NSString *text = zeit.projekt.name;
        if (zeit.projekt.kunde != nil) {
            text = [NSString stringWithFormat:@"%@(%@)", text, zeit.projekt.kunde.name];
        }
        label.text = text;
    }
    
    label = (UILabel *)[cell viewWithTag:4];
    label.text = zeit.leistung.name;
    
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
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

#pragma mark - Own Methods


@end
