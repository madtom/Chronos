//
//  CNX_Projekt.h
//  Chronos
//
//  Created by Thomas Dubiel on 08.09.12.
//  Copyright (c) 2012 Thomas Dubiel. All rights reserved.
//

#import <CoreData/CoreData.h>
#import "Kunde.h"

@interface Projekt : NSManagedObject

@property (nonatomic, retain) NSString *name;
@property (nonatomic, retain) NSString *bemerkung;
@property (nonatomic, retain) NSDecimalNumber *budget;
@property (nonatomic, retain) NSString *budgetTyp;
@property (nonatomic, retain) Kunde *kunde;

@end
