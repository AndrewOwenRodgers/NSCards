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
	//Checks to see whether we should be performing the methods for player 1 or player 2
	if ((self.gameEngine.devicePlayer.canTouchBoard && self.gameEngine.devicePlayer.isWhitePlayer) || (self.gameEngine.opponent.canTouchBoard && self.gameEngine.opponent.isWhitePlayer))
	{
		for (NSPlayerOperationQueue *queue in self.whitePlayerThreads)
		{
			if (queue.isDoingStuff)
			{
				queue.iterationsPerformed += queue.numberOfSequentialQueues;
				if (queue.iterationsPerformed >= queue.masterIterations)
				{
					[[self.cardsInPlay objectAtIndex:queue.indexOfCard] performGameMethod];
					queue.iterationsPerformed = 0;
					queue.masterIterations = 0;
				}
			}
		}
	}
	else
	{
		for (NSPlayerOperationQueue *queue in self.blackPlayerThreads)
		{
			if (queue.isDoingStuff)
			{
				queue.iterationsPerformed += queue.numberOfSequentialQueues;
				if (queue.iterationsPerformed >= queue.masterIterations)
				{
					[[self.cardsInPlay objectAtIndex:queue.indexOfCard] performGameMethod];
					queue.iterationsPerformed = 0;
					queue.masterIterations = 0;
				}
			}
		}
	}
}

-(void)resetPlayerQueue
{
	if ((self.gameEngine.devicePlayer.canTouchBoard && self.gameEngine.devicePlayer.isWhitePlayer) || (self.gameEngine.opponent.canTouchBoard && self.gameEngine.opponent.isWhitePlayer))
	{
		for (NSPlayerOperationQueue *queue in self.whitePlayerThreads)
		{
			if (queue.masterIterations == 0)
			{
				queue.isDoingStuff = FALSE;
			}
		}
	}
	else
	{
		for (NSPlayerOperationQueue *queue in self.blackPlayerThreads)
		{
			if (queue.masterIterations == 0)
			{
				queue.isDoingStuff = FALSE;
			}
		}
	}
}

@end