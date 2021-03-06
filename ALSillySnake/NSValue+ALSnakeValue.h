//
//  NSValue+ALSnakeValue.h
//  ALSillySnake
//
//  Created by allenlin on 5/20/14.
//  Copyright (c) 2014 KKBOX. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ALSnakeWorld.h"
#import "ALSnakeStructs.h"


@interface NSValue (ALSnakeWorldPoint)
+ (id)valueWithSnakeWorldPoint:(ALSnakeWorldPoint)point;
- (ALSnakeWorldPoint)worldPointWithValue;
@end
