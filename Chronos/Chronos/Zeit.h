//
//  CNX_Zeit.h
//  Chronos
//
//  Created by Thomas Dubiel on 08.09.12.
//  Copyright (c) 2012 Thomas Dubiel. All rights reserved.
//

#import <CoreData/CoreData.h>
#import "Leistung.h"
#import "Projekt.h"

//@class Leistung, Projekt;

@interface Zeit : NSManagedObject

@property (nonatomic, retain) NSDate *datum;
@property (nonatomic, retain) NSString *bemerkung;
@property (nonatomic, retain) Leistung *leistung;
@property (nonatomic, retain) Projekt *projekt;
@property (nonatomic, retain) NSDecimalNumber *dauer;


@end
