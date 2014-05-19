//
//  ALSnakeViewDelegate.h
//  ALSillySnake
//
//  Created by allenlin on 5/19/14.
//  Copyright (c) 2014 KKBOX. All rights reserved.
//

#import <Foundation/Foundation.h>
@class ALSnakeWorld;
@class ALSnakeView;

@protocol ALSnakeViewProtocol <NSObject>
-(ALSnakeWorld *)snakeWorldForSnakeView:(ALSnakeView *)view;
@end
