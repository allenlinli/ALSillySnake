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

@interface ALSnakeTest : XCTestCase

@end



@implementation ALSnakeTest

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

- (void)testSnakeInit
{
    NSUInteger length = 3;
    NSUInteger width = 20;
    NSUInteger height = 20;
    ALSnakeWorldSize worldSize = ALSnakeWorldSizeMake(width, height);
    ALSnake *snake = [[ALSnake alloc] initWithWorldSize:worldSize length:length];
    

    for (NSUInteger i = 0; i<length; i++) {
        NSValue *value = snake.body[i];
        XCTAssertNotNil(value, @"snake.body[i] is nil");
        ALSnakeWorldPoint body = [snake.body[i] snakeWorldPointWithValue];
        XCTAssertTrue(body.x == width/2.0+i && body.y == height/2.0,@"! (body.x == width/2.0+i && body.y == height/2.0)");
    }
    
    
}

@end
