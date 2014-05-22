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
//@property (strong, nonatomic) ALSnake *snake;
@property (strong, nonatomic) ALSnakeWorld *world;
@end



@implementation ALSnakeTest

- (void)setUp
{
    [super setUp];
    
    NSUInteger length = InitialSnakeLength;
    NSUInteger width = ALSnakeWorldSizeWidth;
    NSUInteger height = ALSnakeWorldSizeHeight;
    ALSnakeWorldSize worldSize = ALSnakeWorldSizeMake(width, height);
    self.world = [[ALSnakeWorld alloc] initWithSize:worldSize];
    [self.world makeNewSnakeWithLength:length];
    
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
//    self.snake = nil;
    [super tearDown];
}

- (void)testSnakeInit
{
    ALSnake *snake = self.world.snake;
    
    for (NSUInteger i = 0; i< snake.bodyPoints.count; i++) {
        NSValue *value = snake.bodyPoints[i];
        XCTAssertNotNil(value, @"snake.body[i] is nil");
        ALSnakeWorldPoint body = [snake.bodyPoints[i] worldPointWithValue];
        logWorldPoint(body);
        NSUInteger x2 = (NSUInteger)(self.world.size.width/2.0+i) % self.world.size.width;
        XCTAssertTrue(body.x == x2 && body.y ==  self.world.size.height/2.0,@"! (body.x == width/2.0+i && body.y == height/2.0)");
    }
    
    XCTAssert(snake.direction == ALSnakeDirectionLeft, @"! snake.direction == ALSnakeDirectionLeft");
}

-(void)testMove{
    ALSnake *snake = self.world.snake;
    
    ALSnakeWorldPoint originalHeadPoint = [(NSValue *)[snake.bodyPoints firstObject] worldPointWithValue];
    
    //Test move left
    [snake move];
    ALSnakeWorldPoint newHeadPoint = [(NSValue *)[snake.bodyPoints firstObject] worldPointWithValue];
    XCTAssertTrue(newHeadPoint.x == originalHeadPoint.x -1, @"newHeadPoint.x == originalHeadPoint.x -1");
}

-(void)testChangeDeriction
{
    ALSnake *snake = self.world.snake;

    XCTAssertTrue(snake.direction == ALSnakeDirectionLeft, @"snake.direction == ALSnakeDirectionLeft");
    snake.direction = ALSnakeDirectionDown;
    XCTAssertTrue(snake.direction == ALSnakeDirectionDown, @"snake.direction == ALSnakeDirectionDown");
    snake.direction = ALSnakeDirectionUp;
    XCTAssertTrue(snake.direction == ALSnakeDirectionDown, @"snake.direction == ALSnakeDirectionDown");
}

-(void)testChangeDerictionAndMove{
    ALSnake *snake = self.world.snake;
    
    snake.direction = ALSnakeDirectionDown;
    XCTAssertTrue(snake.direction == ALSnakeDirectionDown, @"snake.direction == ALSnakeDirectionDown");
    
    ALSnakeWorldPoint originalHeadPoint = [(NSValue *)[snake.bodyPoints firstObject] worldPointWithValue];
    [snake move];
    ALSnakeWorldPoint newHeadPoint = [(NSValue *)[snake.bodyPoints firstObject] worldPointWithValue];
    XCTAssertTrue(newHeadPoint.y == originalHeadPoint.y +1, @"newHeadPoint.x == originalHeadPoint.x + 1");
}

//-(void)testIsHeadHitBody
//{
//    ALSnake *snake = self.world.snake;
//    
//    
//}


@end
