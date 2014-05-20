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
    ALSnakeWorld *snakeWorld = [self.delegate snakeWorldForSnakeView:self];
    if (snakeWorld.size.width<=0 || snakeWorld.size.height<=0) {
        return;
    }
    
    CGContextRef contextRef = UIGraphicsGetCurrentContext();
    /*
     w * x = 螢幕上的x位置
     w * y = 螢幕上的y位置
     */
    CGFloat widthScale = self.bounds.size.width/snakeWorld.size.width;
    CGFloat heightScale = self.bounds.size.height/snakeWorld.size.height;

//    if (snake) {
//        [[UIColor blackColor] set];
//        for (NSValue *value in snake.points) {
//            ALSnakeWorldPoint point = [value snakeWorldPointWithValue];
//            CGRect rect = CGRectMake(w*point.x, h*point.y, w, h);
//			CGContextFillRect(ctx, rect);
//        }
//    }
}


@end
