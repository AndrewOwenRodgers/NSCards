//
//  NSBoard.m
//  NSCards
//
//  Created by Andrew Rodgers on 3/4/14.
//  Copyright (c) 2014 Andrew Rodgers. All rights reserved.
//

#import "NSBoard.h"
#import "TurnEngine.h"

@implementation NSBoard

-(id)init
{
	if (self = [super init])
	{
		self.p1Threads = [[NSMutableArray alloc] init];
		self.p2Threads = [[NSMutableArray alloc] init];
		self.cardsInPlay = [[NSMutableArray alloc] init];
	}
	
	return self;
}

-(NSMutableArray *)addThreadToPlayerThreadArray:(NSMutableArray *)threads
{
	[threads addObject:[[NSPlayerOperationQueue alloc] init]];
	return threads;
}

@end