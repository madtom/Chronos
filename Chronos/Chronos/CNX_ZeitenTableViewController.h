//
//  CNX_ZeitenTableViewController.h
//  Chronos
//
//  Created by Thomas Dubiel on 12.09.12.
//  Copyright (c) 2012 Thomas Dubiel. All rights reserved.
//

#import <UIKit/UIKit.h>
#include "CNX_AppDelegate.h"

@interface CNX_ZeitenTableViewController : UITableViewController

@property (nonatomic, retain) NSFetchedResultsController *fetchedResultsController;

@end