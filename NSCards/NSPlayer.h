//
//  NSPlayer.h
//  NSCards
//
//  Created by Andrew Rodgers on 3/4/14.
//  Copyright (c) 2014 Andrew Rodgers. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSPlayer : NSObject

@property (strong, nonatomic) NSArray *cardsInHand;
@property (strong, nonatomic) NSArray *deck;
@property (nonatomic) BOOL isWhitePlayer;
@property (strong, nonatomic) NSString *displayName;

@end