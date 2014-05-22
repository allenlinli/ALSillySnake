//
//  NSValue+ALSnakeValue.m
//  ALSillySnake
//
//  Created by allenlin on 5/20/14.
//  Copyright (c) 2014 KKBOX. All rights reserved.
//

#import "NSValue+ALSnakeValue.h"

@implementation NSValue (ALSnakeWorldPoint)

+ (id)valueWithSnakeWorldPoint:(ALSnakeWorldPoint)point
{
	return	[NSValue valueWithBytes:&point objCType:@encode(ALSnakeWorldPoint)];
}

- (ALSnakeWorldPoint)worldPointWithValue{
    if (strcmp([self objCType], @encode(ALSnakeWorldPoint)) != 0) {
        return ALSnakeWorldPointMake(0, 0);
    }
    
    ALSnakeWorldPoint point;
    [self getValue:&point];
    return point;
}
@end
