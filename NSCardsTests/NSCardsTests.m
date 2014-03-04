//
//  NSCardsTests.m
//  NSCardsTests
//
//  Created by Andrew Rodgers on 2/28/14.
//  Copyright (c) 2014 Andrew Rodgers. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "TurnEngine.h"

@interface NSCardsTests : XCTestCase

@end

@implementation NSCardsTests

- (void)setUp
{
    [super setUp];
}

- (void)tearDown
{
    [super tearDown];
}

-(void)testGameStart
{
	TurnEngine *gameEngine = [TurnEngine sharedEngine];
	[gameEngine setUpBoard];
	
	XCTAssertNotNil(gameEngine.devicePlayer);
	XCTAssertNotNil(gameEngine.opponent);
	
	XCTAssertTrue(gameEngine.devicePlayer.isWhitePlayer);
	XCTAssertTrue(!gameEngine.opponent.isWhitePlayer);

	XCTAssertTrue(gameEngine.devicePlayer.cardsInHand.count == 5);
	XCTAssertTrue(gameEngine.devicePlayer.deck.count == 25);
	
	XCTAssertNotEqualObjects(gameEngine.devicePlayer.displayName, gameEngine.opponent.displayName);
}

@end
