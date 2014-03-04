//
//  TurnEngine.m
//  NSCards
//
//  Created by Andrew Rodgers on 3/4/14.
//  Copyright (c) 2014 Andrew Rodgers. All rights reserved.
//

#import "TurnEngine.h"

@implementation TurnEngine

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
