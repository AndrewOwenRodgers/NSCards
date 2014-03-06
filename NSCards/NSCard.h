//
//  NSCard.h
//  NSCards
//
//  Created by Nicholas Barnard on 3/6/14.
//  Copyright (c) 2014 Andrew Rodgers. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class NSCardType;

@interface NSCard : NSManagedObject

@property (nonatomic) BOOL isWhiteCard;
@property (nonatomic) int cycleCount;
@property (nonatomic) int retain_Count;
@property (nonatomic, retain) NSDictionary *cardRelationships;
@property (nonatomic, retain) NSCardType *cardTemplate;

@end
