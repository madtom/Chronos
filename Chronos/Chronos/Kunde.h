//
//  CNX_Kunde.h
//  Chronos
//
//  Created by Thomas Dubiel on 08.09.12.
//  Copyright (c) 2012 Thomas Dubiel. All rights reserved.
//

#import <CoreData/CoreData.h>

@interface Kunde : NSManagedObject

@property (nonatomic, retain) NSString *name;
@property (nonatomic, retain) NSString *bemerkung;

@end
