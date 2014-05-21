//
//  ALSnake.m
//  ALSillySnake
//
//  Created by allenlin on 5/19/14.
//  Copyright (c) 2014 KKBOX. All rights reserved.
//

#import "ALSnakeWorld.h"
#import "ALSnake.h"

const NSInteger InitialSnakeLength = 10;

@implementation ALSnake

#pragma initialization

-(ALSnake *)initWithWorld:(ALSnakeWorld *)world
{
    return [self initWithWorld:world length:InitialSnakeLength];
}

-(ALSnake *)initWithWorld:(ALSnakeWorld *)world length:(NSUInteger)length
{
    ALSnakeWorldSize worldSize = world.size;
    if (length <= 0) {
        return nil;
    }
    else if (worldSize.width <= 5 || worldSize.height <=5){
        return nil;
    }
    
    self = [super init];
    if (self) {
        _world = world;
        self.bodyPoints = [[NSMutableArray alloc] init];
        NSUInteger x = (NSUInteger) worldSize.width / 2.0;
        NSUInteger y = (NSUInteger) worldSize.height / 2.0;
        for (NSUInteger i = 0; i<length; i++) {
            NSValue *obj = [NSValue valueWithSnakeWorldPoint:ALSnakeWorldPointMake(x+i,y)];
            [self.bodyPoints addObject:obj];
        }
        self.direction = ALSnakeDirectionLeft;
    }
    
    return self;
}

-(void)setDirection:(ALSnakeDirection)direction{
    
    //分"上下"或"左右" 兩種情況
    if (self.direction == ALSnakeDirectionLeft || self.direction == ALSnakeDirectionRight) {
        if (direction == ALSnakeDirectionUp || direction == ALSnakeDirectionDown) {
            _direction = direction;
        }
    }
    else{
        if (direction == ALSnakeDirectionLeft || direction == ALSnakeDirectionRight) {
            _direction = direction;
        }
    }
}

-(ALSnakeWorldPoint)headingPoint
{
    /*
     功能：
     1. 前進一格
     2. 穿牆
     
     實作：
     1. 使用 mod 來做穿牆
     2. 使用 xOffset, yOffset
     
     */
    
    //結果的值
    ALSnakeWorldPoint currentHeadLocation = [[self.bodyPoints firstObject] worldPointWithValue];
    ALSnakeWorldPoint nextLocation = currentHeadLocation;
    
    switch (self.direction) {
        case ALSnakeDirectionLeft:
            nextLocation.x += -1;
            break;
        case ALSnakeDirectionRight:
            nextLocation.x += 1;
            break;
        case ALSnakeDirectionUp:
            nextLocation.y += -1;
            break;
        case ALSnakeDirectionDown:
            nextLocation.y += 1;
            break;
        default:
            break;
    }
    
    //工具的值
    NSUInteger worldWidth = self.world.size.width;
    NSUInteger worldHeight = self.world.size.height;

    if (nextLocation.x < 0) {
        nextLocation.x += worldWidth;
    }
    else if (nextLocation.x >= worldWidth) {
        nextLocation.x = nextLocation.x % worldWidth;
    }
    
    if (nextLocation.y < 0) {
        nextLocation.y += worldHeight;
    }
    else if (nextLocation.y >= worldHeight) {
        nextLocation.y = nextLocation.y % worldHeight;
    }
    return nextLocation;
}

-(void)move {
    /*
     功能：前進、吃水果、撞牆死掉
     */
    ALSnakeWorldPoint headPoint = [(NSValue *)[self.bodyPoints firstObject] worldPointWithValue];
    
    if (self.isDead) {
        return;
    }
    else if (self.bodyPoints.count<=0) {
        return;
    }
    //若是頭的位置不合理
    else if (!(headPoint.x < self.world.size.width && headPoint.y < self.world.size.height)){
        NSLog(@"[Error]");
        return;
    }

    NSMutableArray *bodyWithoutTail = [self.bodyPoints mutableCopy];
    [bodyWithoutTail removeLastObject];
    
    // # 頭前面是蛇的身體的話，就會死掉
    
    // SnakeHeadingStateWillBeDead
    if (isWorldPointContainedInArray(self.headingPoint, bodyWithoutTail)) {
        
        _isDead = YES;
    
        return;
    
    }
    
    //# 頭前面是水果的話，就會吃下去。並且讓世界產生一個水果
    
    else if (isWorldPointEqual(self.headingPoint, self.world.fruitPoint)){
    
        //頭增加一格。enqueue
        
        [self.bodyPoints insertObject:[NSValue valueWithSnakeWorldPoint:self.headingPoint] atIndex:0];
    
        [self.world makeFruit];
        
        return;
    }
    
    //# 剩下情況，就會前進一格
    
    else{
    
        //頭增加一格。enqueue
        
        [self.bodyPoints insertObject:[NSValue valueWithSnakeWorldPoint:self.headingPoint] atIndex:0];
        
        //尾巴少掉一格。dequeue
        
        [self.bodyPoints removeObjectAtIndex:self.bodyPoints.count-1];
    
        return;
    }

}
@end
