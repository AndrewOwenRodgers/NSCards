//
//  NSBoard.h
//  NSCards
//
//  Created by Andrew Rodgers on 3/4/14.
//  Copyright (c) 2014 Andrew Rodgers. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSPlayer.h"
#import "NSPlayerOperationQueue.h"

@class TurnEngine;

@interface NSBoard : NSObject

@property (strong, nonatomic) NSMutableArray *cardsInPlay;
@property (strong, nonatomic) NSMutableArray *p1Threads;
@property (strong, nonatomic) NSMutableArray *p2Threads;
@property (weak, nonatomic) TurnEngine *gameEngine;

-(NSMutableArray *)addThreadToPlayerThreadArray:(NSMutableArray *)threads;

@end