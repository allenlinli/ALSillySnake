#import "ALSnakeStructs.h"
#import "NSValue+ALSnakeValue.h"

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

BOOL isWorldSizeEqual( ALSnakeWorldSize one, ALSnakeWorldSize two){
    return (one.width == two.width && one.height == two.height);
}


BOOL isWorldPointEqual(ALSnakeWorldPoint one,ALSnakeWorldPoint two){
    return (one.x == two.x && one.y == two.y);
}

BOOL isWorldPointContainedInArray(ALSnakeWorldPoint point, NSArray *array){
    for (NSValue *value in array) {
        if (isWorldPointEqual(point, [value worldPointWithValue])) {
            return YES;
        }
    }
    
    return NO;
}

void logWorldPoint(ALSnakeWorldPoint point){
    NSLog(@"logWorldPoint point.x:%i, point.y:%i",point.x,point.y);
}

void logWorldPointArray(NSArray *array){
    for (NSValue *value in array) {
        ALSnakeWorldPoint point = [value worldPointWithValue];
        NSLog(@"logWorldPoint point.x:%i, point.y:%i",point.x,point.y);
    }
}