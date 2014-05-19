//
//  ALSnakeWorldTest.m
//  ALSillySnake
//
//  Created by allenlin on 5/19/14.
//  Copyright (c) 2014 KKBOX. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "ALSnakeWorld.h"

@interface ALSnakeWorldTest : XCTestCase

@end

@implementation ALSnakeWorldTest

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

- (void)testWorldSizeMake
{
    NSUInteger width = 20;
    NSUInteger height = 20;
    ALSnakeWorldSize worldSize = ALSnakeWorldSizeMake(width, height);
    
    XCTAssertTrue(worldSize.width == width, @"! worldSize.width == 20");
    XCTAssertTrue(worldSize.height == height, @"! worldSize.height == 20");
}

@end
