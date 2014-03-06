//
//  QueuesCells.m
//  NSCards
//
//  Created by Chad D Colby on 3/6/14.
//  Copyright (c) 2014 Andrew Rodgers. All rights reserved.
//

#import "QueuesCells.h"

@implementation QueuesCells

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.clipsToBounds = YES;
        self.layer.cornerRadius = 10.0f;
        
    }
    return self;
}


@end
