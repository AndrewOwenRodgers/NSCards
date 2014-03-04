//
//  TurnEngine.h
//  NSCards
//
//  Created by Andrew Rodgers on 3/4/14.
//  Copyright (c) 2014 Andrew Rodgers. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSPlayer.h"

@interface TurnEngine : NSObject

@property (strong, nonatomic) NSPlayer *devicePlayer;
@property (strong, nonatomic) NSPlayer *opponent;

+(TurnEngine *)sharedEngine;
-(void)setUpBoard;

@end
