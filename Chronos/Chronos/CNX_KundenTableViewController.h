//
//  CNX_KundenTableViewController.h
//  Chronos
//
//  Created by Thomas Dubiel on 12.09.12.
//  Copyright (c) 2012 Thomas Dubiel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CNX_AppDelegate.h"

@interface CNX_KundenTableViewController : UITableViewController

@property (nonatomic, retain) NSFetchedResultsController *fetchedResultsController;

@end
