//
//  NSPlayer.m
//  NSCards
//
//  Created by Andrew Rodgers on 3/4/14.
//  Copyright (c) 2014 Andrew Rodgers. All rights reserved.
//

#import "NSPlayer.h"
#import "NSCard.h"
#import "TurnEngine.h"
#import "NSCardType.h"

@implementation NSPlayer

-(id)initWithColor:(BOOL)color
{
	self.deck = [[NSMutableArray alloc] init];
	if (self = [super init])
	{
		self.isWhitePlayer = color;
		self.deck = [[NSMutableArray alloc] init];
		self.cardsInHand = [[NSMutableArray alloc] init];
		self.deck = [self setupDeckWithTemplate:@"standard"];
	}
	return self;
}

-(void)drawCard
{
	NSCard *drawnCard = self.deck[0];
	[self.deck removeObjectAtIndex:0];
	[self.cardsInHand addObject:drawnCard];
}

-(void)playCardAtIndex:(NSInteger)cardIndex
{
	NSCard *cardToPlay = self.cardsInHand[cardIndex];
	[self.cardsInHand removeObjectAtIndex:cardIndex];
	[self.gameEngine.board.cardsInPlay addObject:cardToPlay];
}

-(NSMutableArray *)setupDeckWithTemplate: (NSString *) deckTemplate {
    NSMutableArray *newDeck = [NSMutableArray new];

    NSString *fileName = [[NSBundle mainBundle] pathForResource:@"cardTemplates" ofType:@"plist"];
    NSMutableDictionary *templateDictionary = [[NSMutableDictionary alloc] initWithContentsOfFile:fileName];

    for (NSDictionary* newCardTypeDict in templateDictionary) {
        NSString *newCardTypeName = [newCardTypeDict objectForKey:@"name"];
        NSCardType *newCardType = [[NSCardType alloc] initWithDictionary:newCardTypeDict];
        [templateDictionary setObject:newCardType forKey:newCardTypeName];
    }

    fileName = [[NSBundle mainBundle] pathForResource:@"cardStacks" ofType:@"plist"];

    NSDictionary *allCardStacks = [[NSDictionary alloc] initWithContentsOfFile:fileName];

    NSDictionary *cardStack = [allCardStacks objectForKey:deckTemplate];

    NSDictionary *cards = [cardStack objectForKey:@"cards"];
    NSArray *cardNames =  [cards allKeys];

    for (NSString *cardName in cardNames) {
        NSInteger numberOfCards = [[cards objectForKey:cardName] integerValue];
        NSCardType *cardType = [templateDictionary objectForKey:cardName];
        for(int i=0; i < (numberOfCards - 1); i++) {
            NSCard *newCard = [[NSCard alloc] initWithCardType:cardType];
            [newDeck addObject:newCard];
        }
    }

    if ([[cardStack objectForKey:@"sortType"] isEqualToString:@"random"]) {
        NSInteger arrayLen = [newDeck count];
        for (NSInteger i = 0; i < arrayLen; i++) {
            NSInteger randInt = arc4random_uniform((u_int32_t)(arrayLen - i)) + i;
            [newDeck exchangeObjectAtIndex:i withObjectAtIndex:randInt];
        };

    }

    for (int i = 0; i < 30; i++)
    {
        NSCard *card = [[NSCard alloc] init];
        card.isWhiteCard = self.isWhitePlayer;
        [newDeck addObject:card];
    }

    return newDeck;
}


@end
