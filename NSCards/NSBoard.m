//
//  NSBoard.m
//  NSCards
//
//  Created by Andrew Rodgers on 3/4/14.
//  Copyright (c) 2014 Andrew Rodgers. All rights reserved.
//

#import "NSBoard.h"
#import "TurnEngine.h"
#import "NSCard.h"

@implementation NSBoard

-(id)init
{
	if (self = [super init])
	{
		self.whitePlayerThreads = [[NSMutableArray alloc] init];
		self.blackPlayerThreads = [[NSMutableArray alloc] init];
		self.cardsInPlay = [[NSMutableArray alloc] init];
	}
	
	return self;
}

-(NSMutableArray *)addThreadToPlayerThreadArray:(NSMutableArray *)threads
{
	[threads addObject:[[NSPlayerOperationQueue alloc] init]];
	return threads;
}

-(void)checkForDiscards
{
	for (NSCard *card in self.cardsInPlay)
	{
		if (card.retain_Count < 1)
		{
			[self.cardsInPlay removeObject:card];
			if (card.isWhiteCard)
			{
				[self.whitePlayerDiscardPile addObject:card];
			}
			else
			{
				[self.blackPlayerDiscardPile addObject:card];
			}
		}
	}
}

-(void)performPlayerMethods
{
	if ((self.gameEngine.devicePlayer.canTouchBoard && self.gameEngine.devicePlayer.isWhitePlayer) || (self.gameEngine.opponent.canTouchBoard && self.gameEngine.opponent.isWhitePlayer))
	{
		
	}
	else
	{
		
	}
}

@end