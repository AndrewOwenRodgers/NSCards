//
//  NSCardsDocument.m
//  CardMaker
//
//  Created by John Clem on 2014-03-03.
//  Copyright (c) 2014 John Clem. All rights reserved.
//

#import "NSCardsDocument.h"
#import "Card.h"

@interface NSCardsDocument ()

@property (strong) NSMutableArray	*	cards;
@property (strong) NSString			*	blackBack;
@property (strong) NSString			*	whiteBack;

@end


@implementation NSCardsDocument

- (id)init
{
    self = [super init];
    if (self)
	{
		self.blackBack = @"NSCards";
		self.whiteBack = @"NSCards";
    }
    return self;
}

- (NSString *)windowNibName
{
	// Override returning the nib file name of the document
	// If you need to use a subclass of NSWindowController or if your document supports multiple NSWindowControllers, you should remove this method and override -makeWindowControllers instead.
	return @"NSCardsDocument";
}

- (void)windowControllerDidLoadNib:(NSWindowController *)aController
{
	[super windowControllerDidLoadNib:aController];
	// Add any code here that needs to be executed once the windowController has loaded the document's window.
	
	[self.cardsTableView reloadData];
	[self tableViewSelectionDidChange: nil];
}

+ (BOOL)autosavesInPlace
{
    return YES;
}

- (NSData *)dataOfType:(NSString *)typeName error:(NSError **)outError
{
	NSMutableString		*	cardsString = [NSMutableString string];
	
	[cardsString stringByAppendingFormat: @"BLACK-BACK\n%@",self.blackBack];
	[cardsString stringByAppendingFormat: @"WHITE-BACK\n%@",self.whiteBack];
	
	for( Card *card in self.cards )
	{
        [cardsString stringByAppendingFormat:@"%@\n%@\n\n", card.cardColor, card.text];
	}
	
	return nil;
}

- (BOOL)readFromData:(NSData *)data ofType:(NSString *)typeName error:(NSError **)outError
{
	NSString *cardList = [[NSString alloc] initWithData: data encoding: NSUTF8StringEncoding];
	NSArray *lines = [cardList componentsSeparatedByCharactersInSet: [NSCharacterSet newlineCharacterSet]];
    Card *card;
	self.cards = [NSMutableArray array];
//	self.whiteBack = nil;
//	self.blackBack = nil;

	for( NSString * currLine in lines )
	{
		if([currLine isEqualToString: @"WHITE"] || [currLine isEqualToString: @"BLACK"]) {
            card = [Card new];
            card.cardColor = currLine;
		}
        else if ([currLine rangeOfString:@"CLASS"].location != NSNotFound) {
            card.className = [currLine stringByReplacingOccurrencesOfString:@"CLASS " withString:@""];
        }
		else if(currLine.length > 0 ) {
			if(card.text) {
				[card.text appendFormat:@"\n%@", currLine];
            } else {
				card.text = [NSMutableString stringWithString:currLine];
            }
            NSLog(@"Card Text: %@", card.text);
		} else {            
            [self.cards addObject:card];	// Save previous card.
            [self.cardsTableView reloadData];
            [self tableViewSelectionDidChange: nil];
        }
	}

	return YES;
}


- (NSInteger)numberOfRowsInTableView:(NSTableView *)tableView
{
	return self.cards.count;
}

- (id)tableView:(NSTableView *)tableView objectValueForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row
{
	if( row >= 0 ) {
        Card *card = _cards[row];
        return card.text;
    }
    return nil;
}


-(void)	saveImage: (NSImage*)theImg name: (NSString*)baseName
{
	[theImg lockFocus];
		NSBitmapImageRep	*	bir = [[NSBitmapImageRep alloc] initWithFocusedViewRect: NSMakeRect(0,0,theImg.size.width,theImg.size.height)];
	[theImg unlockFocus];
	NSData	*	pngData = [bir representationUsingType: NSPNGFileType properties: @{}];
	[pngData writeToFile: [[NSString stringWithFormat: @"~/Desktop/%@.png", baseName] stringByExpandingTildeInPath] atomically: YES];
}


-(IBAction)	buildAllImages: (id)sender
{
	BOOL		builtBlackBack = NO;
	BOOL		builtWhiteBack = NO;
	
	for( NSInteger x = 0; x < self.cards.count; x++ )
	{
		[self.cardsTableView selectRowIndexes: [NSIndexSet indexSetWithIndex: x] byExtendingSelection: NO];
		[self.listWindow display];
		
		Card *currCard = [self.cards objectAtIndex: self.cardsTableView.selectedRow];
		if( [currCard.cardColor isEqualToString: @"BLACK"] && !builtBlackBack )
		{
			[self saveImage: self.backImageView.image name: @"black_back"];
			
			builtBlackBack = YES;
		}
		else if([currCard.cardColor isEqualToString: @"WHITE"] && !builtWhiteBack )
		{
			[self saveImage: self.backImageView.image name: @"white_back"];
			
			builtWhiteBack = YES;
		}
		
//		[self saveImage: self.cardImageView.image name: [NSString stringWithFormat: @"card_%@_%ld", [currCard[@"color"] lowercaseString], x +1]];
		[self saveImage: self.cardImageView.image name: [NSString stringWithFormat: @"%ld", x +1]];
	}
}


-(void)	tableViewSelectionDidChange: (NSNotification*)notif
{
	if( self.cards.count < self.cardsTableView.selectedRow )
		return;
	
	NSColor			*	accentColor = [NSColor colorWithCalibratedRed:0.140 green:0.292 blue:0.458 alpha:1.000];
	Card            *	currCard = [self.cards objectAtIndex: self.cardsTableView.selectedRow];
	
	CGFloat		cardScaleFactor = 6;
	CGFloat		cardWidth = 62.25;
	CGFloat		cardHeight = 62.25;
	CGFloat		cardTopMargin = 7;
	CGFloat		cardBottomMargin = 10;
	CGFloat		cardHorzMargin = 7;
	
	NSRect		cardBox = NSMakeRect( 0, 0, cardWidth * cardScaleFactor, cardHeight * cardScaleFactor );
	NSImage	*	frontImage = [[NSImage alloc] initWithSize: cardBox.size];
	[frontImage lockFocus];
		// Paint card background & pick colors:
		NSColor	*	textColor = nil;
		NSString*	subText = nil;
		if( [currCard.cardColor isEqualToString: @"BLACK"] )
		{
			[NSColor.blackColor set];
			textColor = NSColor.whiteColor;
			subText = self.blackBack;
		}
		else if( [currCard.cardColor isEqualToString: @"WHITE"] )
		{
			[NSColor.whiteColor set];
			textColor = NSColor.blackColor;
			subText = self.whiteBack;
		}
		[NSBezierPath fillRect: cardBox];
		
		// Actual text of card:
		NSRect	textRect = NSInsetRect(cardBox, cardHorzMargin * cardScaleFactor, 0 );
		textRect.size.height -= (cardTopMargin + cardBottomMargin) * cardScaleFactor;
		textRect.origin.y += cardBottomMargin * cardScaleFactor;
		
		NSFont	*	theFont = [NSFont fontWithName: @"HelveticaNeue-Light" size: 5 * cardScaleFactor];
//		theFont = [[NSFontManager sharedFontManager] convertFont: theFont toHaveTrait: NSBoldFontMask];
    
		[currCard.text drawInRect: textRect withAttributes: @{ NSForegroundColorAttributeName: textColor, NSFontAttributeName: theFont }];

		// Byline with game name under card:
		NSRect		subTextRect = NSInsetRect(cardBox, cardHorzMargin * cardScaleFactor, 0 );
		subTextRect.size.height = cardBottomMargin * cardScaleFactor;
		
		NSImage	*	logoImage = [NSImage imageNamed: @"logo"];
		NSRect		logoBox = NSZeroRect;
		CGFloat		desiredHeight = subTextRect.size.height;
		logoBox.size.width = logoImage.size.width / (logoImage.size.height / desiredHeight);
		logoBox.size.height = desiredHeight;
		logoImage.size = logoBox.size;
		logoBox.origin.x = subTextRect.origin.x;
		logoBox.origin.y = subTextRect.origin.y +subTextRect.size.height -desiredHeight/1.5;
		[logoImage drawInRect: logoBox];
		
		subTextRect.origin.x += ceil(logoBox.size.width) +cardScaleFactor;
		subTextRect.size.width -= ceil(logoBox.size.width) +cardScaleFactor;
		theFont = [NSFont fontWithName: @"HelveticaNeue-Light" size: 4 * cardScaleFactor];
//		theFont = [[NSFontManager sharedFontManager] convertFont: theFont toHaveTrait: NSBoldFontMask];
		NSMutableAttributedString	*	attrText = [[NSMutableAttributedString alloc] initWithString: currCard.className attributes: @{ NSForegroundColorAttributeName: textColor, NSFontAttributeName: theFont }];
		NSInteger	offs = [subText rangeOfString: @"NS" options: NSBackwardsSearch].location;
		if( offs != NSNotFound )
		{
            NSLog(@"Not Found");
			[attrText addAttribute: NSForegroundColorAttributeName value: accentColor range: NSMakeRange( offs, subText.length -(offs +5))];
		}
		[attrText.mutableString replaceOccurrencesOfString: @"#" withString: @"\n" options: 0 range: NSMakeRange(0, subText.length)];
		[attrText drawInRect: subTextRect];
	[frontImage unlockFocus];
	
	self.cardImageView.image = frontImage;
	
	NSImage	*	backImage = [[NSImage alloc] initWithSize: cardBox.size];
	[backImage lockFocus];
		textColor = nil;
		NSString	*	text = nil;
		if( [currCard.cardColor isEqualToString: @"BLACK"] )
		{
			[NSColor.blackColor set];
			textColor = NSColor.whiteColor;
			text = self.blackBack;
		}
		else if( [currCard.cardColor isEqualToString: @"WHITE"] )
		{
			[NSColor.whiteColor set];
			textColor = NSColor.blackColor;
			text = self.whiteBack;
		}
		[NSBezierPath fillRect: cardBox];
		textRect = NSInsetRect(cardBox, cardHorzMargin * cardScaleFactor, 0 );
		textRect.size.height -= (cardTopMargin + cardBottomMargin) * cardScaleFactor;
		textRect.origin.y += cardBottomMargin;
		
		theFont = [NSFont fontWithName: @"HelveticaNeue-Light" size: 11 * cardScaleFactor];
//		theFont = [[NSFontManager sharedFontManager] convertFont: theFont toHaveTrait: NSBoldFontMask];
		attrText = [[NSMutableAttributedString alloc] initWithString: text attributes: @{ NSForegroundColorAttributeName: textColor, NSFontAttributeName: theFont }];
		offs = [text rangeOfString: @"NS" options: NSBackwardsSearch].location;
		if( offs != NSNotFound )
		{
			[attrText addAttribute: NSForegroundColorAttributeName value: accentColor range: NSMakeRange( offs, text.length -(offs +5))];
		}
		[attrText drawInRect: textRect];
	[backImage unlockFocus];
	
	self.backImageView.image = backImage;
}

@end
