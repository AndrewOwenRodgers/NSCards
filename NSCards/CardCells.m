//
//  CardCells.m
//  NSCards
//
//  Created by Chad D Colby on 3/6/14.
//  Copyright (c) 2014 Andrew Rodgers. All rights reserved.
//

#import "CardCells.h"

@implementation CardCells

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.cardView = [[AMDraggableBlurView alloc] init];
        [self.cardView setDraggable:YES];
        self.cardView.layer.masksToBounds = YES;
        self.cardView.layer.cornerRadius = 10.0f;
        
    }
    return self;
}


@end
