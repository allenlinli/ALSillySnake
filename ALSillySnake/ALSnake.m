//
//  ALSnake.m
//  ALSillySnake
//
//  Created by allenlin on 5/19/14.
//  Copyright (c) 2014 KKBOX. All rights reserved.
//

#import "ALSnake.h"
#import "NSValue+ALSnakeValue.h"
#import "ALSnakeWorld.h"

@implementation ALSnake

-(ALSnake *)initWithWorld:(ALSnakeWorld *)world length:(NSUInteger)length{
    ALSnakeWorldSize worldSize = world.size;
    
    if (length<=0) {
        return nil;
    }
    else if (worldSize.width <= 5 || worldSize.height <=5){
        return nil;
    }

    /* 本文 */
    self = [super init];
    if (self) {
        self.points = [[NSMutableArray alloc]init];
        NSUInteger x = (NSUInteger) worldSize.width / 2.0;
        NSUInteger y = (NSUInteger) worldSize.height / 2.0;
        for (NSUInteger i = 0; i<length; i++) {
            NSValue *obj = [NSValue valueWithSnakeWorldPoint:ALSnakeWorldPointMake(x+i,y)];
            [self.points addObject:obj];
        }
        self.direction = ALSnakeDirectionLeft;
    }
    
    
    return self;
}

-(NSUInteger)bodyLength{
    return self.points.count;
}

@end
