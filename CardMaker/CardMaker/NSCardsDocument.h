//
//  NSCardsDocument.h
//  CardMaker
//
//  Created by John Clem on 2014-03-03.
//  Copyright (c) 2014 John Clem. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface NSCardsDocument : NSDocument

@property (weak) IBOutlet NSWindow *listWindow;
@property (weak) IBOutlet NSTableView *cardsTableView;
@property (weak) IBOutlet NSImageView *cardImageView;
@property (weak) IBOutlet NSImageView *backImageView;

-(IBAction)	buildAllImages: (id)sender;

@end
