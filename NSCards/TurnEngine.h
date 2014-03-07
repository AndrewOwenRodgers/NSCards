//
//  TurnEngine.h
//  NSCards
//
//  Created by Andrew Rodgers on 3/4/14.
//  Copyright (c) 2014 Andrew Rodgers. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSPlayer.h"
#import "NSBoard.h"

@interface TurnEngine : NSObject

@property (strong, nonatomic) NSPlayer *devicePlayer;
@property (strong, nonatomic) NSPlayer *opponent;
@property (strong, nonatomic) NSBoard *board;
@property (nonatomic) BOOL gameFinished;
@property (nonatomic) BOOL whitePlayerWon;

+(TurnEngine *)sharedEngine;
-(void)setUpBoard;
-(void)endTurn;

@end
