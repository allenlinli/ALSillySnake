//
//  ALSnakeWorld.m
//  ALSillySnake
//
//  Created by allenlin on 5/19/14.
//  Copyright (c) 2014 KKBOX. All rights reserved.
//

#import "ALSnakeWorld.h"


ALSnakeWorldSize ALSnakeWorldSizeMake(NSUInteger width, NSUInteger height){
    ALSnakeWorldSize worldSize;
    worldSize.width = width;
    worldSize.height = height;
    return worldSize;
}

ALSnakeWorldPoint ALSnakeWorldPointMake(NSUInteger x, NSUInteger y){
    ALSnakeWorldPoint point;
    point.x = x;
    point.y = y;
    return point;
}

@implementation NSValue (ALSnakeWorldPoint)

+ (id)valueWithSnakeWorldPoint:(ALSnakeWorldPoint)point
{
	return	[NSValue valueWithBytes:&point objCType:@encode(ALSnakeWorldPoint)];
}

- (ALSnakeWorldPoint)snakeWorldPointWithValue{
    if (strcmp([self objCType], @encode(ALSnakeWorldPoint)) != 0) {
        return ALSnakeWorldPointMake(0, 0);
    }
    
    ALSnakeWorldPoint point;
    [self getValue:&point];
    return point;
}
@end

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

@end
