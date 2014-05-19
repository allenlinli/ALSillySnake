//
//  ALSnakeStrucs.h
//  ALSillySnake
//
//  Created by allenlin on 5/19/14.
//  Copyright (c) 2014 KKBOX. All rights reserved.
//

#ifndef ALSillySnake_ALSnakeStrucs_h
#define ALSillySnake_ALSnakeStrucs_h

typedef struct{
    NSUInteger width;
	NSUInteger height;
}ALSnakeWorldSize;
ALSnakeWorldSize ALSnakeWorldSizeMake(NSUInteger width, NSUInteger height);

typedef struct{
    NSUInteger x;
	NSUInteger y;
}ALSnakeWorldPoint;
ALSnakeWorldPoint ALSnakeWorldPointMake(NSUInteger x, NSUInteger y);
@class ALSnakeWorld;

#endif
