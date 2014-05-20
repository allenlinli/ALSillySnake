//
//  ALSnake.m
//  ALSillySnake
//
//  Created by allenlin on 5/19/14.
//  Copyright (c) 2014 KKBOX. All rights reserved.
//

#import "ALSnakeWorld.h"
#import "ALSnake.h"



@implementation ALSnake

#pragma initialization

-(ALSnake *)initWithWorld:(ALSnakeWorld *)world length:(NSUInteger)length{
    _world = world;
    
    ALSnakeWorldSize worldSize = self.world.size;
    
    if (length<=0) {
        return nil;
    }
    else if (worldSize.width <= 5 || worldSize.height <=5){
        return nil;
    }

    /* 本文 */
    self = [super init];
    if (self) {
        self.bodyPoints = [[NSMutableArray alloc]init];
        NSUInteger x = (NSUInteger) worldSize.width / 2.0;
        NSUInteger y = (NSUInteger) worldSize.height / 2.0;
        for (NSUInteger i = 0; i<length; i++) {
            NSValue *obj = [NSValue valueWithSnakeWorldPoint:ALSnakeWorldPointMake(x+i,y)];
            [self.bodyPoints addObject:obj];
        }
        self.direction = ALSnakeDirectionLeft;
        
        _world.snake = self;
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

-(ALSnakeWorldPoint)headPoint{
    NSValue *value = [self.bodyPoints firstObject];
    return [value snakeWorldPointWithValue];
}


-(ALSnakeWorldPoint)headingPoint{
    //結果的值
    ALSnakeWorldPoint headingPoint;
    NSUInteger headingX;
    NSUInteger headingY;
    
    //工具的值
    NSUInteger worldWidth = self.world.size.width;
    NSUInteger worldHeight = self.world.size.height;
    
    NSUInteger headX = self.headPoint.x;
    NSUInteger headY = self.headPoint.y;
    
    //先計算出Offset
    NSInteger headingXOffset;
    NSInteger headingYOffset;
    
    switch (self.direction) {
        case ALSnakeDirectionLeft:
            headingXOffset = -1;
            break;
        case ALSnakeDirectionUp:
            headingYOffset = 1;
            break;
        case ALSnakeDirectionRight:
            headingXOffset = 1;
            break;
        case ALSnakeDirectionDown:
            headingYOffset = -1;
            break;
        default:
            break;
    }
    
    
    //假如點已經在邊界了，而且接下來會出界的話，就穿牆
    if (headX == 0 && headingXOffset == -1) {
        headX = worldWidth - 1;
    }
    else if(headX == worldWidth-1 && headingXOffset == 1){
        headX = 0;
    }
    else if(headY == 0 && headingYOffset == -1){
        headY = worldHeight - 1;
    }
    else if(headY == worldHeight -1 && headingYOffset == 1){
        headY = 0;
    }
    //假如點在正常範圍的話
    else if(headX > 0 && headX < worldWidth -1 && headY > 0 && headY < worldHeight -1){
        headingX = headX + headingXOffset;
        headingY = headY + headingYOffset;
    }
    //有錯誤
    else{
        //Error
        NSLog(@"Error");
    }
    
    headingPoint.x = headingX;
    headingPoint.y = headingY;
    
    return headingPoint;
}

-(ALSnakeWorldPoint)tailPoint{
    NSValue *value = [self.bodyPoints lastObject];
    return [value snakeWorldPointWithValue];
}

-(void)move{
    
    if (self.isDead) {
        return;
    }
    else if (self.bodyPoints.count<=0) {
        return;
    }
    
    //頭前面是水果的話，吃掉它
    
    //頭前面是蛇的身體的話，就會死掉
    
    //頭前面是牆壁的話，就會穿牆
    //橫的穿牆
    if (self.headingPoint.x < 0){
        
    }
    else if(self.headingPoint.x >= self.world.size.width) {
        
    }
    else if(self.headingPoint.y < 0){
        
    }
     else if(self.headingPoint.y >= self.world.size.height){
        
    }
    
    //剩下情況，就會前進一格
    
    
    
    //頭增加一格。enqueue
    [self.bodyPoints insertObject:[NSValue valueWithSnakeWorldPoint:self.headingPoint] atIndex:0];
    
    //尾巴少掉一格。dequeue
    [self.bodyPoints removeObjectAtIndex:self.bodyPoints.count-1];
}
@end
