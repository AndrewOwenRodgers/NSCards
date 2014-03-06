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
	
	XCTAssertNotEqual(gameEngine.devicePlayer.isWhitePlayer, gameEngine.opponent.isWhitePlayer);

	XCTAssertTrue(gameEngine.devicePlayer.cardsInHand.count == 5);
	XCTAssertTrue(gameEngine.devicePlayer.deck.count == 25);
	
	XCTAssertNotEqualObjects(gameEngine.devicePlayer.displayName, gameEngine.opponent.displayName);
	
	XCTAssert(gameEngine.board.p1Threads.count == 2);
	XCTAssert(gameEngine.board.p2Threads.count == 2);
	XCTAssert(gameEngine.devicePlayer.threads.count == 2);
	XCTAssert(gameEngine.opponent.threads.count == 2);
}

-(void)testChangeTurns
{
	TurnEngine *gameEngine = [TurnEngine sharedEngine];
	[gameEngine setUpBoard];
	
	BOOL couldTouchBoard = gameEngine.devicePlayer.canTouchBoard;
	[gameEngine endTurn];
	
	XCTAssert(gameEngine.devicePlayer.canTouchBoard != couldTouchBoard);
	XCTAssert(gameEngine.devicePlayer.canTouchBoard != gameEngine.opponent.canTouchBoard);
}

-(void)testPlayACard
{
	TurnEngine *gameEngine = [TurnEngine sharedEngine];
	[gameEngine setUpBoard];
	[gameEngine.devicePlayer playCardAtIndex:2];
	
	XCTAssert(gameEngine.devicePlayer.cardsInHand.count == 4);
	XCTAssert(gameEngine.board.cardsInPlay.count == 1);
}

@end
