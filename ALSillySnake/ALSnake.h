//
//  ALSnake.h
//  ALSillySnake
//
//  Created by allenlin on 5/19/14.
//  Copyright (c) 2014 KKBOX. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ALSnakeStrucs.h"


typedef enum{
    ALSnakeDirectionLeft,
    ALSnakeDirectionUp,
    ALSnakeDirectionRight,
    ALSnakeDirectionDown
}ALSnakeDirection;

@class ALSnakeWorld;

@interface ALSnake : NSObject

/* if yes, the snake is dead. */
@property (readonly, nonatomic) BOOL isHeadHitBody;

#pragma Status
@property (strong, nonatomic) NSMutableArray *points;
@property (assign, nonatomic) ALSnakeDirection direction;
@property (readonly, nonatomic) NSUInteger bodyLength;

#pragma Move
-(ALSnake *)initWithWorld:(ALSnakeWorld *)world length:(NSUInteger)length;

/* Move a dot */
//-(void)move:(ALSnakeDirection)direction;

/* increase length by eat fruit */
//-(void)increaseLength;
@end
