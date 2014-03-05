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

@implementation NSPlayer

-(id)initWithColor:(BOOL)color
{
	self.deck = [[NSMutableArray alloc] init];
	if (self = [super init])
	{
		self.isWhitePlayer = color;
		self.deck = [[NSMutableArray alloc] init];
		self.cardsInHand = [[NSMutableArray alloc] init];
		
		for (int i = 0; i < 30; i++)
		{
			NSCard *card = [[NSCard alloc] init];
			card.isWhiteCard = self.isWhitePlayer;
			[self.deck addObject:card];
		}
	}
	return self;
}

-(void)drawCard
{
	NSCard *drawnCard = self.deck[0];
	[self.deck removeObjectAtIndex:0];
	[self.cardsInHand addObject:drawnCard];
}

@end
