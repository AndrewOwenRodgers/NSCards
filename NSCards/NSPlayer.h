//
//  NSPlayer.h
//  NSCards
//
//  Created by Andrew Rodgers on 3/4/14.
//  Copyright (c) 2014 Andrew Rodgers. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSPlayer : NSObject

@property (nonatomic) BOOL isWhitePlayer;
@property (strong, nonatomic) NSString *displayName;

@property (strong, nonatomic) NSMutableArray *cardsInHand;
@property (strong, nonatomic) NSMutableArray *deck;
@property (weak, nonatomic) NSMutableArray *threads;

-(id)initWithColor:(BOOL)color;
-(void)drawCard;

@end