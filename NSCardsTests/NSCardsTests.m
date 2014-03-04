//
//  NSCardsTests.m
//  NSCardsTests
//
//  Created by Andrew Rodgers on 2/28/14.
//  Copyright (c) 2014 Andrew Rodgers. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface NSCardsTests : XCTestCase

@end

@implementation NSCardsTests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample
{
    NSString *doNothingTest = @"This Test Does Nothing";
    XCTAssertNotNil(doNothingTest, @"Foundation is broken, duck and cover!");
}

@end
