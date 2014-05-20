//
//  ALSnakeWorld.h
//  ALSillySnake
//
//  Created by allenlin on 5/19/14.
//  Copyright (c) 2014 KKBOX. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ALSnakeViewProtocol.h"
#import "ALSnakeStrucs.h"

@class ALSnake;

/*
 世界擁有蛇：

 世界負責產生水果
 
 
 */
@interface ALSnakeWorld : NSObject 

#pragma Region
@property (assign, nonatomic) ALSnakeWorldSize size;

#pragma Snake
@property (strong, nonatomic) ALSnake *snake;

#pragma Init
-(ALSnakeWorld *)initWithSize:(ALSnakeWorldSize)size;

#pragma Fruit Generator
-(ALSnakeWorldPoint)fruitWolrdPointWithSnakeWorldPointX:(NSUInteger)x y:(NSUInteger)y;




@end






