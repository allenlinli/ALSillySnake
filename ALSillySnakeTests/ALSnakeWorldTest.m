//
//  ALSnakeWorldTest.m
//  ALSillySnake
//
//  Created by allenlin on 5/19/14.
//  Copyright (c) 2014 KKBOX. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "ALSnakeWorld.h"
#import "ALSnake.h"




@interface ALSnakeWorldTest : XCTestCase
@property (strong, nonatomic) ALSnakeWorld *world;

@end

@implementation ALSnakeWorldTest

- (void)setUp
{
    [super setUp];
    
    
    self.world = [[ALSnakeWorld alloc] initWithSize:ALSnakeWorldSizeMake(ALSnakeWorldSizeWidth, ALSnakeWorldSizeHeight)];
}

- (void)tearDown
{
    self.world = nil;
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testWorldSizeMake
{
    ALSnakeWorldSize worldSize = ALSnakeWorldSizeMake(ALSnakeWorldSizeWidth, ALSnakeWorldSizeHeight);
    XCTAssertTrue(worldSize.width == ALSnakeWorldSizeWidth, @"! worldSize.width == 20");
    XCTAssertTrue(worldSize.height == ALSnakeWorldSizeHeight, @"! worldSize.height == 20");
}

- (void)testInitWorld
{
    // testing temp
    self.world = [[ALSnakeWorld alloc] initWithSize:ALSnakeWorldSizeMake(ALSnakeWorldSizeWidth, ALSnakeWorldSizeHeight)];
    
    ALSnakeWorld *world = self.world;

    XCTAssertNotNil(world, @"world is nil");
    XCTAssertTrue(world.size.width == ALSnakeWorldSizeWidth, @"! world.size.width == width");
    XCTAssertTrue(world.size.height == ALSnakeWorldSizeHeight, @"! world.size.height == height");
}

-(void)testIsPointInSnakeBody{
    ALSnakeWorld *world = self.world;
    ALSnake *snake = [[ALSnake alloc] initWithWorld:world length:3];
    world.snake = snake;
    
    ALSnakeWorldPoint snakePoint = [(NSValue *)[snake.bodyPoints firstObject] worldPointWithValue];
    NSLog(@"log snakePoint:%i %i",snakePoint.x,snakePoint.y);
    XCTAssertTrue(isWorldPointContainedInArray(ALSnakeWorldPointMake(ALSnakeWorldSizeWidth/2, ALSnakeWorldSizeHeight/2), self.world.snake.bodyPoints), @"[world isPointInSnakeBody:ALSnakeWorldPointMake(20, 20)]");
    XCTAssertTrue(isWorldPointContainedInArray(ALSnakeWorldPointMake(ALSnakeWorldSizeWidth/2+1, ALSnakeWorldSizeHeight/2), self.world.snake.bodyPoints), @"[world isPointInSnakeBody:ALSnakeWorldPointMake(21, 20)]");
    XCTAssertTrue(isWorldPointContainedInArray(ALSnakeWorldPointMake(ALSnakeWorldSizeWidth/2+2, ALSnakeWorldSizeHeight/2), self.world.snake.bodyPoints), @"[world isPointInSnakeBody:ALSnakeWorldPointMake(22, 20)]");
}

-(void)testMakeFruit{
    ALSnakeWorld *world = self.world;
    [world makeFruit];
    
    XCTAssert(world.fruitPoint.x >=0 && world.fruitPoint.x < world.size.width, @"world.fruitPoint.x >=0 && world.fruitPoint.x < world.size.width");
    XCTAssert(world.fruitPoint.y >=0 && world.fruitPoint.y < world.size.height, @"world.fruitPoint.y >=0 && world.fruitPoint.y < world.size.height");

    XCTAssertTrue(!isWorldPointContainedInArray(self.world.fruitPoint, self.world.snake.bodyPoints), @"[world isPointInSnakeBody:ALSnakeWorldPointMake(22, 20)]");
}

-(void)testIsWorldPointContainedInArray{
    ALSnakeWorld *world = self.world;
    ALSnake *snake = [[ALSnake alloc] initWithWorld:world length:3];
    world.snake = snake;
    
    
    XCTAssertTrue(isWorldPointContainedInArray( [(NSValue *)[snake.bodyPoints firstObject] worldPointWithValue], snake.bodyPoints), @"!isWorldPointContainedInArray( [(NSValue *)[snake.bodyPoints firstObject] worldPointWithValue], snake.bodyPoints)");
}

@end
