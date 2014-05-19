//
//  ALSnakeViewController.h
//  ALSillySnake
//
//  Created by allenlin on 5/19/14.
//  Copyright (c) 2014 KKBOX. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ALSnakeView.h"



@interface ALSnakeViewController : UIViewController 

#pragma Game State
-(void)startGame;
-(void)pauseGame;
-(void)endGame;
-(void)gameState;

#pragma Timer
-(void)runOneRound;


@end
