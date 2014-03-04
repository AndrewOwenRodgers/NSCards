//
//  TurnEngine.h
//  NSCards
//
//  Created by Andrew Rodgers on 3/4/14.
//  Copyright (c) 2014 Andrew Rodgers. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TurnEngine : NSObject

+(TurnEngine *)sharedEngine;
-(void)setUpBoard;

@end
