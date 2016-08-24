//
//  ALSnakeWorld.m
//  ALSillySnake
//
//  Created by allenlin on 5/19/14.
//  Copyright (c) 2014 KKBOX. All rights reserved.
//

#import "ALSnakeWorld.h"
#import "ALSnake.h"

const NSInteger ALSnakeWorldSizeWidth = 12;
const NSInteger ALSnakeWorldSizeHeight = ALSnakeWorldSizeWidth * 480/320;

@implementation ALSnakeWorld

-(ALSnakeWorld *)initWithSize:(ALSnakeWorldSize)size{
    /* Error handle */
    if (size.height<5 || size.width<5){
        NSLog(@"[Error] init failed. size.width :%li  size.height :%li",(long)size.width,(long)size.height);
        return nil;
    }
    
    self = [super init];
    if (self) {
        self.size = size;
        [self makeNewSnake];
    }
    
    return self;
}

-(void)makeNewSnake
{
    self.snake = [[ALSnake alloc] initWithWorld:self];
}

-(void)makeNewSnakeWithLength:(NSInteger)length
{
    self.snake = [[ALSnake alloc] initWithWorld:self length:length];
}

-(void)makeFruit
{
    ALSnakeWorldPoint fruitPoint;

    do {
        fruitPoint.x = arc4random() % self.size.width;
        fruitPoint.y = arc4random() % self.size.height;
    } while ([self isPointInSnakeBodyWithPoint:fruitPoint]);
    
    _fruitPoint = fruitPoint;
}

-(BOOL)isPointInSnakeBodyWithPoint:(ALSnakeWorldPoint)point{
    for (NSValue *value in self.snake.bodyPoints) {
        ALSnakeWorldPoint snakePoint = [value worldPointWithValue];
        if (isWorldPointEqual(snakePoint, point)) {
            return true;
        }
    }
    return false;
}

@end
