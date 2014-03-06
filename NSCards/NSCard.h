//
//  NSCard.h
//  NSCards
//
//  Created by Nicholas Barnard on 3/5/14.
//  Copyright (c) 2014 Andrew Rodgers. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class NSCardType;

typedef enum cardLocation {
    stack = 0,
    discard = 1,
    hand = 2,
    playfield =3
} cardLocation;

@interface NSCard : NSManagedObject

@property (nonatomic) cardLocation location;
@property (nonatomic) BOOL isWhiteCard;
@property (nonatomic, retain) NSCardType *cardTemplate;

@end
