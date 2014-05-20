//
//  ALSnakeWorld.m
//  ALSillySnake
//
//  Created by allenlin on 5/19/14.
//  Copyright (c) 2014 KKBOX. All rights reserved.
//

#import "ALSnakeWorld.h"


@implementation ALSnakeWorld

-(ALSnakeWorld *)initWithSize:(ALSnakeWorldSize)size{
    /* Error handle */
    if (size.height<5 || size.width<5){
        return nil;
    }
    
    self = [super init];
    if (self) {
        self.size = size;
    }
    
    return self;
}

#pragma - protocol
-(ALSnakeWorld *)snakeWorldForSnakeView:(ALSnakeView *)view{
    return self;
}

@end
