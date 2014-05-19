//
//  ALSnakeView.h
//  ALSillySnake
//
//  Created by allenlin on 5/19/14.
//  Copyright (c) 2014 KKBOX. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ALSnakeWorld.h"
#import "ALSnake.h"
#import "ALSnakeViewProtocol.h"

@class ALSnake;
@class ALSnakeView;



@interface ALSnakeView : UIView
@property (assign, nonatomic) ALSnakeWorldSize worldSize;
@property (weak, nonatomic) id <ALSnakeViewProtocol> delegate;
@end
