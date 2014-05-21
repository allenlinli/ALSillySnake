//
//  ALSnakeViewController.h
//  ALSillySnake
//
//  Created by allenlin on 5/19/14.
//  Copyright (c) 2014 KKBOX. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ALSnakeView.h"

/*
 負責開始遊戲、暫停遊戲、結束遊戲
 
 負責給 View 畫面。
 
 開始遊戲：負責產生世界和蛇的物件，開始每秒移動他們。
 
 */

@interface ALSnakeViewController : UIViewController <ALSnakeViewProtocol>
-(void)startGame;
-(void)pauseGame;
-(void)endGame;
@end
