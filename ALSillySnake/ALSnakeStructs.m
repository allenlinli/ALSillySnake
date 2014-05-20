#import "ALSnakeStructs.h"

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