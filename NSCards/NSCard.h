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

@property (nonatomic, retain) id cardRelationships;
@property (nonatomic) int retain_Count;
@property (nonatomic) int cycleCount;
@property (nonatomic) BOOL isWhiteCard;
@property (nonatomic) BOOL isDuplicate;
@property (nonatomic, retain) NSCardType *cardTemplate;

- (NSDictionary *) getBlankGameInitDictionary;
- (BOOL) gameInitCardWithValues: (NSDictionary *) GameInitDictionary;
- (void) performGameMethodForGameSelector: (NSString *) gameSelectorToPerform;
- (NSCard *) initWithCardType: (NSCardType *) cardType;
- (BOOL) performGameMethod;

@end
