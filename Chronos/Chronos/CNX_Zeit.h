//
//  CNX_Zeit.h
//  Chronos
//
//  Created by Thomas Dubiel on 08.09.12.
//  Copyright (c) 2012 Thomas Dubiel. All rights reserved.
//

#import <CoreData/CoreData.h>

@interface CNX_Zeit : NSManagedObject

@property (nonatomic, retain) NSDate *datum;
@property (nonatomic, retain) NSString *bemerkung;
@property (nonatomic, retain) NSDecimalNumber *dauer;


@end
