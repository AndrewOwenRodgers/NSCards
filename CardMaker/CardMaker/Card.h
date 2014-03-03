//
//  Card.h
//  CardMaker
//
//  Created by John Clem on 3/3/14.
//  Copyright (c) 2014 John Clem. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject

@property (nonatomic, strong) NSMutableDictionary *methods;
@property (nonatomic, strong) NSNumber *cost;
@property (nonatomic, strong) NSMutableString *text;
@property (nonatomic, strong) NSString *className;
@property (nonatomic, strong) NSString *cardColor;

@end
