//
//  TurnEngine.m
//  NSCards
//
//  Created by Andrew Rodgers on 3/4/14.
//  Copyright (c) 2014 Andrew Rodgers. All rights reserved.
//

#import "TurnEngine.h"

@implementation TurnEngine

-(void)setUpBoard
{
	self.devicePlayer = [[NSPlayer alloc] initWithColor:TRUE];
	self.opponent = [[NSPlayer alloc] initWithColor:FALSE];
	self.board = [[NSBoard alloc] init];
	
	self.devicePlayer.isWhitePlayer = TRUE;
	self.opponent.isWhitePlayer = FALSE;
	self.devicePlayer.displayName = @"Player";
	self.opponent.displayName = @"Opponent";
	self.devicePlayer.canTouchBoard = TRUE;
	self.opponent.canTouchBoard = FALSE;
	
	for (int i = 0; i < 2; i++)
	{
		[self.board addThreadToPlayerThreadArray:self.board.whitePlayerThreads];
		[self.board addThreadToPlayerThreadArray:self.board.blackPlayerThreads];
	}
	
	self.devicePlayer.threads = self.board.whitePlayerThreads;
	self.opponent.threads = self.board.blackPlayerThreads;
	self.devicePlayer.gameEngine = self;
	self.opponent.gameEngine = self;
	self.board.gameEngine = self;
	
	for (int i = 0; i < 5; i++)
	{
		[self.devicePlayer drawCard];
	}
}

-(void)endTurn
{
	[self.board performPlayerMethods];
	[self.board checkForDiscards];
	[self.board resetPlayerQueue];
	self.gameFinished = [self checkWinConditions];
	
	if (self.gameFinished)
	{
		
	}
	else
	{
		if (self.devicePlayer.canTouchBoard)
		{
			self.devicePlayer.canTouchBoard = FALSE;
			self.opponent.canTouchBoard = TRUE;
		}
		else
		{
			self.devicePlayer.canTouchBoard = TRUE;
			self.opponent.canTouchBoard = FALSE;
		}
	}
}

-(BOOL)checkWinConditions
{
	BOOL allQueuesBlocked = TRUE;
	for (NSPlayerOperationQueue *queue in self.opponent.threads)
	{
		if (!queue.isDoingStuff)
		{
			
		}
	}
	if (allQueuesBlocked)
	{
		self.whitePlayerWon = self.devicePlayer.isWhitePlayer;
		return TRUE;
	}
	
	allQueuesBlocked = TRUE;
	for(NSPlayerOperationQueue *queue in self.devicePlayer.threads)
	{
		
	}
	if (allQueuesBlocked)
	{
		self.whitePlayerWon = self.opponent.isWhitePlayer;
		return TRUE;
	}
	return FALSE;
}

+(TurnEngine *)sharedEngine
{
	static dispatch_once_t pred;
	static TurnEngine *shared = nil;
	dispatch_once(&pred, ^{
		shared = [[TurnEngine alloc] init];
	});
	return shared;
}

@end
