//
//  ALSnake.m
//  ALSillySnake
//
//  Created by allenlin on 5/19/14.
//  Copyright (c) 2014 KKBOX. All rights reserved.
//

#import "ALSnakeWorld.h"
#import "ALSnake.h"

const NSInteger InitialSnakeLength = 5;
@interface ALSnake ()
{
    NSMutableArray *bodyPoints;
}
@property (readonly, weak, nonatomic) ALSnakeWorld *world;
@end

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
        bodyPoints = [[NSMutableArray alloc] init];
        NSUInteger x = (NSUInteger) worldSize.width / 2.0;
        NSUInteger y = (NSUInteger) worldSize.height / 2.0;
        for (NSUInteger i = 0; i<length; i++) {
            NSUInteger x2 = (x+i) % self.world.size.width;
            NSValue *obj = [NSValue valueWithSnakeWorldPoint:ALSnakeWorldPointMake(x2,y)];
            [bodyPoints addObject:obj];
        }
        self.direction = ALSnakeDirectionLeft;
    }
    
    return self;
}

-(void)setDirection:(ALSnakeDirection)direction
{    
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

-(ALSnakeWorldPoint)nextHeadPoint
{
    /*
     說明：
     頭即將要到的位置
     
     */
    
    //結果的值
    ALSnakeWorldPoint currentHeadLocation = [[self.bodyPoints firstObject] worldPointWithValue];
    ALSnakeWorldPoint nextLocation = currentHeadLocation;
    
    switch (self.direction) {
        case ALSnakeDirectionLeft:
            nextLocation.x -= 1;
            break;
        case ALSnakeDirectionRight:
            nextLocation.x += 1;
            break;
        case ALSnakeDirectionUp:
            nextLocation.y -= 1;
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

- (BOOL)isHeadHitBody
{
    NSMutableArray *bodyWithoutHead = [self.bodyPoints mutableCopy];
    [bodyWithoutHead removeObjectAtIndex:0];
    ALSnakeWorldPoint headPoint = [[self.bodyPoints firstObject] worldPointWithValue];
    return isWorldPointContainedInArray(headPoint, bodyWithoutHead);
}

-(void)move
{
    ALSnakeWorldPoint headPoint = [(NSValue *)[self.bodyPoints firstObject] worldPointWithValue];
    
   if (!(headPoint.x >=0 && headPoint.x < self.world.size.width && headPoint.y>=0 &&  headPoint.y < self.world.size.height)){
        NSLog(@"[Error]");
        return;
    }

    [bodyPoints insertObject:[NSValue valueWithSnakeWorldPoint:self.nextHeadPoint] atIndex:0];
    [bodyPoints removeObjectAtIndex:self.bodyPoints.count-1];
}

- (void)extendBodyWithLength:(NSInteger)length
{
    ALSnakeWorldPoint tailPoint = [[self.bodyPoints lastObject] worldPointWithValue];
    [bodyPoints addObject:[NSValue valueWithSnakeWorldPoint:tailPoint]];
}

- (BOOL)isTouchingFruit:(ALSnakeWorldPoint)point
{
    return isWorldPointContainedInArray(point, self.bodyPoints);
}

@synthesize bodyPoints;

@end
