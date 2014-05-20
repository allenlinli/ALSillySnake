//
//  ALSnake.h
//  ALSillySnake
//
//  Created by allenlin on 5/19/14.
//  Copyright (c) 2014 KKBOX. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ALSnakeStrucs.h"

/*
 蛇知道他的世界：
 蛇產生在某一個世界
 
 蛇屬於某一個世界
 
 蛇會移動
 蛇會吃水果
 
 
 */

typedef enum{
    ALSnakeDirectionLeft,
    ALSnakeDirectionUp,
    ALSnakeDirectionRight,
    ALSnakeDirectionDown
}ALSnakeDirection;


@class ALSnakeWorld;

@interface ALSnake : NSObject


#pragma Status
@property (strong, nonatomic) NSMutableArray *points;
@property (readonly, nonatomic) NSUInteger bodyLength;

@property (assign, nonatomic) ALSnakeDirection direction;

@property (readonly, nonatomic) ALSnakeWorld *world;

#pragma Move
/* if yes, the snake is dead. */
@property (readonly, nonatomic) BOOL isHeadHitBody;

/* */
-(ALSnake *)initWithWorld:(ALSnakeWorld *)world length:(NSUInteger)length;

/* Move a dot */
-(void)move:(ALSnakeDirection)direction;

/* increase length by eat fruit */
-(void)increaseLength;
@end
