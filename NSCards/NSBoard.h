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
@property (strong, nonatomic) NSMutableArray *whitePlayerThreads;
@property (strong, nonatomic) NSMutableArray *blackPlayerThreads;
@property (weak, nonatomic) TurnEngine *gameEngine;
@property (strong, nonatomic) NSMutableArray *whitePlayerDiscardPile;
@property (strong, nonatomic) NSMutableArray *blackPlayerDiscardPile;

-(NSMutableArray *)addThreadToPlayerThreadArray:(NSMutableArray *)threads;
-(void)checkForDiscards;

@end