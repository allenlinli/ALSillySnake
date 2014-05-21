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

@property (assign, nonatomic) ALSnakeWorldSize size;


#pragma Init
-(ALSnakeWorld *)initWithSize:(ALSnakeWorldSize)size;

#pragma Fruit Generator
-(void)makeNewSnakeWithLength:(NSInteger)length;
@property (strong, nonatomic) ALSnake *snake;

-(void)makeFruit;
@property (assign, readonly, nonatomic) ALSnakeWorldPoint fruitPoint;

@end






