//
//  ALSnakeStrucs.h
//  ALSillySnake
//
//  Created by allenlin on 5/19/14.
//  Copyright (c) 2014 KKBOX. All rights reserved.
//

/* 
 世界的空間分佈是 
 x: 0 ~ (width-1)
 y: 0 ~ (height-1)
 */

typedef struct {
    NSUInteger width;
	NSUInteger height;
} ALSnakeWorldSize;

ALSnakeWorldSize ALSnakeWorldSizeMake(NSUInteger width, NSUInteger height);

typedef struct {
    NSUInteger x;
	NSUInteger y;
} ALSnakeWorldPoint;

ALSnakeWorldPoint ALSnakeWorldPointMake(NSUInteger x, NSUInteger y);


BOOL isWorldSizeEqual(ALSnakeWorldSize one,ALSnakeWorldSize two);

BOOL isWorldPointEqual(ALSnakeWorldPoint one,ALSnakeWorldPoint two);

BOOL isWorldPointContainedInArray(ALSnakeWorldPoint point, NSArray *array);

