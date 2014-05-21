//
//  ALSnakeWorld.h
//  ALSillySnake
//
//  Created by allenlin on 5/19/14.
//  Copyright (c) 2014 KKBOX. All rights reserved.
//

/*
 README:
 
 世界擁有蛇
 
 世界負責產生水果
 
 
 */

#import <Foundation/Foundation.h>
#import "ALSnakeViewProtocol.h"
#import "ALSnakeStructs.h"

extern const NSInteger ALSnakeWorldSizeWidth;
extern const NSInteger ALSnakeWorldSizeHeight;

@class ALSnake;

@interface ALSnakeWorld : NSObject 

//邊界大小
@property (assign, nonatomic) ALSnakeWorldSize size;

//擁有一隻蛇
@property (strong, nonatomic) ALSnake *snake;

//擁有一個蘋果
@property (assign, readonly, nonatomic) ALSnakeWorldPoint fruitPoint;

#pragma Init
-(ALSnakeWorld *)initWithSize:(ALSnakeWorldSize)size;

#pragma Fruit Generator
-(void)makeFruit;

-(BOOL)isPointInSnakeBodyWithPoint:(ALSnakeWorldPoint)point;


@end






