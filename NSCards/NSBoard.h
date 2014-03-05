//
//  NSBoard.h
//  NSCards
//
//  Created by Andrew Rodgers on 3/4/14.
//  Copyright (c) 2014 Andrew Rodgers. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSBoard : NSObject

@property (strong, nonatomic) NSMutableArray *objectsOnBoard;
@property (strong, nonatomic) NSMutableArray *p1Threads;
@property (strong, nonatomic) NSMutableArray *p2Threads;

@end
