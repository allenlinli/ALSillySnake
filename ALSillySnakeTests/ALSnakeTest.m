//
//  ALSnakeTest.m
//  ALSillySnake
//
//  Created by allenlin on 5/19/14.
//  Copyright (c) 2014 KKBOX. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "ALSnake.h"
#import "ALSnakeWorld.h"
#import "NSValue+ALSnakeValue.h"

@interface ALSnakeTest : XCTestCase
@property (strong, nonatomic) ALSnake *snake;
@property (strong, nonatomic) ALSnakeWorld *world;
@end



@implementation ALSnakeTest

- (void)setUp
{
    [super setUp];
    
    NSUInteger length = 3;
    NSUInteger width = 20;
    NSUInteger height = 20;
    ALSnakeWorldSize worldSize = ALSnakeWorldSizeMake(width, height);
    self.world = [[ALSnakeWorld alloc]initWithSize:worldSize];
    self.snake = [[ALSnake alloc] initWithWorld:self.world length:length];
    
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    self.snake = nil;
    [super tearDown];
}

- (void)testSnakeInit
{
    ALSnake *snake = self.snake;
    
    for (NSUInteger i = 0; i<self.snake.bodyLength; i++) {
        NSValue *value = snake.points[i];
        XCTAssertNotNil(value, @"snake.body[i] is nil");
        ALSnakeWorldPoint body = [snake.points[i] snakeWorldPointWithValue];
        XCTAssertTrue(body.x == self.world.size.width/2.0+i && body.y ==  self.world.size.height/2.0,@"! (body.x == width/2.0+i && body.y == height/2.0)");
    }
    
    XCTAssert(snake.direction == ALSnakeDirectionLeft, @"! snake.direction == ALSnakeDirectionLeft");
}



@end
