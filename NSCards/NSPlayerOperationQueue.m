//
//  NSPlayerOperationQueue.m
//  NSCards
//
//  Created by Andrew Rodgers on 3/5/14.
//  Copyright (c) 2014 Andrew Rodgers. All rights reserved.
//

#import "NSPlayerOperationQueue.h"

@implementation NSPlayerOperationQueue

-(id)init
{
	if (self = [super init])
	{
		self.numberOfSequentialQueues = 1;
	}
	return self;
}

@end
