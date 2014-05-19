//
//  ALSnakeView.m
//  ALSillySnake
//
//  Created by allenlin on 5/19/14.
//  Copyright (c) 2014 KKBOX. All rights reserved.
//

#import "ALSnakeView.h"
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
    ALSnake *snake = [self.delegate snakeForSnakeView:self];
    ALSnakeWorldSize worldSize = snake.world.size;
    if (worldSize.width<=0 || worldSize.height<=0) {
        return;
    }
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    /*
     w * x = 螢幕上的x位置
     w * y = 螢幕上的y位置
     */
    CGFloat w = self.bounds.size.width/worldSize.width;
    CGFloat h = self.bounds.size.height/worldSize.height;

    
    if (snake) {
        [[UIColor blackColor] set];
        for (NSValue *value in snake.points) {
            ALSnakeWorldPoint point = [value snakeWorldPointWithValue];
            CGRect rect = CGRectMake(w*point.x, h*point.y, w, h);
			CGContextFillRect(ctx, rect);
        }
    }
}


@end
