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
@property (assign, nonatomic) ALSnakeWorldSize worldSize;
@property (assign, nonatomic) NSUInteger width;
@property (assign, nonatomic) NSUInteger height;
@end

@implementation ALSnakeWorldTest

- (void)setUp
{
    [super setUp];
    
    self.width = 20;
    self.height = 20;
    self.worldSize = ALSnakeWorldSizeMake(self.width, self.height);

    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testWorldSizeMake
{
    ALSnakeWorldSize worldSize = self.worldSize;
    XCTAssertTrue(worldSize.width == self.width, @"! worldSize.width == 20");
    XCTAssertTrue(worldSize.height == self.height, @"! worldSize.height == 20");
}

- (void)testInitWorld
{
    ALSnakeWorld *world = [[ALSnakeWorld alloc] initWithSize:self.worldSize];
    
    XCTAssertTrue(world.size.width == self.width, @"! world.size.width == width");
    XCTAssertTrue(world.size.height == self.height, @"! world.size.height == height");
}

@end
