//
//  ALSnakeWorld.h
//  ALSillySnake
//
//  Created by allenlin on 5/19/14.
//  Copyright (c) 2014 KKBOX. All rights reserved.
//

#import <Foundation/Foundation.h>

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

@interface NSValue (ALSnakeWorldPoint)
+ (id)valueWithSnakeWorldPoint:(ALSnakeWorldPoint)point;
- (ALSnakeWorldPoint)snakeWorldPointWithValue;
@end


@interface ALSnakeWorld : NSObject

#pragma Region
@property (assign, nonatomic) BOOL isWallBounded;
@property (assign, nonatomic) ALSnakeWorldSize size;

#pragma Init
-(ALSnakeWorld *)initWithSize:(ALSnakeWorldSize)size;

#pragma Fruit Generator
//-(ALSnakeWorldPoint) fruitWolrdPointWithSnakeWorldPointX:(NSUInteger)x y:(NSUInteger)y;

@end






