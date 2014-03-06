//
//  NSPlayerOperationQueue.h
//  NSCards
//
//  Created by Andrew Rodgers on 3/5/14.
//  Copyright (c) 2014 Andrew Rodgers. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSPlayerOperationQueue : NSObject

@property (nonatomic) NSInteger numberOfSequentialQueues;
@property (nonatomic) BOOL isDoingStuff;

@property (nonatomic) NSInteger indexOfCard;
@property (nonatomic) NSInteger indexOfMethod;
@property (nonatomic) NSInteger masterIterations;
@property (nonatomic) NSInteger iterationsPerformed;

@end
