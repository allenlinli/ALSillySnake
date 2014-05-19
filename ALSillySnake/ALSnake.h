//
//  ALSnake.h
//  ALSillySnake
//
//  Created by allenlin on 5/19/14.
//  Copyright (c) 2014 KKBOX. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ALSnakeWorld.h"

typedef enum{
    ALSnakeDirectionLeft,
    ALSnakeDirectionUp,
    ALSnakeDirectionRight,
    ALSnakeDirectionDown
}ALSnakeDirection;

@interface ALSnake : NSObject




/* if yes, the snake is dead. */
@property (readonly, nonatomic) BOOL isHeadHitBody;

#pragma Status
@property (strong, nonatomic) NSMutableArray *body;
@property (readonly, nonatomic) NSUInteger bodyLength;
@property (assign, nonatomic) ALSnakeDirection direction;


#pragma Move

-(ALSnake *)initWithWorldSize:(ALSnakeWorldSize)worldSize length:(NSUInteger)length;

/* Move a dot */
-(void)move:(ALSnakeDirection)direction;

/* increase length by eat fruit */
-(void)increaseLength;

#pragma 外在關係
@property (readonly, nonatomic) ALSnakeWorldSize worldSize;
@end
