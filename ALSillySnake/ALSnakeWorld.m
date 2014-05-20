//
//  ALSnakeWorld.m
//  ALSillySnake
//
//  Created by allenlin on 5/19/14.
//  Copyright (c) 2014 KKBOX. All rights reserved.
//

#import "ALSnakeWorld.h"
#import "ALSnake.h"

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

//-(ALSnakeWorldPoint)fruitWolrdPointWithSnakeWorldPointX:(NSUInteger)x y:(NSUInteger)y{
//    //產生一個蘋果
//    
//    //蘋果要避免產生在有蛇的地方
//    
//    
//}

@end
