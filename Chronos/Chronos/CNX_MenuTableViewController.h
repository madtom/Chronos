//
//  CNX_MenuTableViewController.h
//  Chronos
//
//  Created by Thomas Dubiel on 12.09.12.
//  Copyright (c) 2012 Thomas Dubiel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CNX_KundenTableViewController.h"
#import "CNX_ProjekteTableViewController.h"
#import "CNX_LeistungenTableViewController.h"
#import "CNX_ZeitenTableViewController.h"

@interface CNX_MenuTableViewController : UITableViewController

@property (nonatomic, retain) CNX_KundenTableViewController *kundenTableViewController;
@property (nonatomic, retain) CNX_ProjekteTableViewController *projekteTableViewController;
@property (nonatomic, retain) CNX_LeistungenTableViewController *leistungenTableViewController;
@property (nonatomic, retain) CNX_ZeitenTableViewController *zeitenTableViewController;

@end
