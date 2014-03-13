//
//  NSCard.m
//  NSCards
//
//  Created by Nicholas Barnard on 3/6/14.
//  Copyright (c) 2014 Andrew Rodgers. All rights reserved.
//

#import "NSCard.h"
#import "NSCardType.h"


@implementation NSCard

@dynamic cardRelationships;
@dynamic cycleCount;
@dynamic isWhiteCard;
@dynamic retain_Count;
@dynamic isDuplicate;
@dynamic cardTemplate;

- (BOOL) performGameMethod {
    return true; // shutting the compiler up
}

- (NSDictionary *) getBlankGameInitDictionary
{

//    NSString *currentCardType = self.cardTemplate.cardClassName;

  //  NSDictionary *requiredDictionary;

    return [NSDictionary new]; //shutting CLANG up while I code.
}

- (BOOL) gameInitCardWithValues: (NSDictionary *) GameInitDictionary
{

    return false; //shutting CLANG up while I code.
}

- (void) performGameMethodForGameSelector: (NSString *) gameSelectorToPerform
{

}

- (NSCard *) initWithCardType: (NSCardType *) cardType {

    return [NSCard init];
}

@end
