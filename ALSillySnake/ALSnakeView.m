//
//  ALSnakeView.m
//  ALSillySnake
//
//  Created by allenlin on 5/19/14.
//  Copyright (c) 2014 KKBOX. All rights reserved.
//

#import "ALSnakeView.h"

#import "ALSnakeWorld.h"
#import "ALSnake.h"


@implementation ALSnakeView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    if (!self.delegate) {
        return;
    }

    ALSnakeWorld *snakeWorld = [self.delegate snakeWorldForSnakeView:self];
    ALSnake *snake = snakeWorld.snake;
    
    if (snakeWorld.size.width<=0 || snakeWorld.size.height<=0) {
        return;
    }
    
    if (!snake) {
        return;
    }
    
    CGContextRef contextRef = UIGraphicsGetCurrentContext();
    /*
     w * x = 螢幕上的x位置
     w * y = 螢幕上的y位置
     */
    CGFloat blockWidth = self.bounds.size.width / snakeWorld.size.width;
    CGFloat blockHeight = self.bounds.size.height / snakeWorld.size.height;

    //# 畫蛇
    [[UIColor blackColor] set];
    for (NSValue *value in snake.bodyPoints) {
        ALSnakeWorldPoint point = [value worldPointWithValue];
        CGRect rectOfSnake = CGRectMake( blockWidth * point.x, blockHeight* point.y, blockWidth, blockHeight);
        CGContextFillRect(contextRef, rectOfSnake);
    }
    
    //# 畫水果
    [[UIColor greenColor] set];
    ALSnakeWorldPoint fruitPoint = snakeWorld.fruitPoint;
    CGRect rectOfFruit = CGRectMake( blockWidth * fruitPoint.x, blockHeight * fruitPoint.y, blockWidth, blockHeight);
    CGContextFillRect(contextRef, rectOfFruit);
}


@end
