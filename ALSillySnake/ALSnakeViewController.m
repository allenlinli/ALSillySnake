//
//  ALSnakeViewController.m
//  ALSillySnake
//
//  Created by allenlin on 5/19/14.
//  Copyright (c) 2014 KKBOX. All rights reserved.
//

#import "ALSnakeViewController.h"
#import "ALSnake.h"
#import "ALSnakeWorld.h"
#import "NSValue+ALSnakeValue.h"

const NSInteger GameSpeed = 7;

@interface ALSnakeViewController ()

#pragma UI
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UIButton *startButton;
@property (weak, nonatomic) IBOutlet UILabel *gameSateLabel;

#pragma Objects
@property (strong, nonatomic) ALSnakeWorld *world;
@property (strong, nonatomic) ALSnake *snake;
@property (weak, nonatomic) IBOutlet ALSnakeView *snakeView;

#pragma Time
@property (strong, nonatomic) NSTimer* timer;
@property (assign, nonatomic) NSUInteger seconds;
@end

@implementation ALSnakeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)addGestureRecognizerWithFourDerictions{
    UISwipeGestureRecognizer *gestureRecognizer0 = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipe:)];
	gestureRecognizer0.direction = UISwipeGestureRecognizerDirectionRight;
	[self.snakeView addGestureRecognizer:gestureRecognizer0];
    
    UISwipeGestureRecognizer *gestureRecognizer1 = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipe:)];
	gestureRecognizer1.direction = UISwipeGestureRecognizerDirectionLeft;
	[self.snakeView addGestureRecognizer:gestureRecognizer1];
    
    UISwipeGestureRecognizer *gestureRecognizer2 = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipe:)];
	gestureRecognizer2.direction = UISwipeGestureRecognizerDirectionUp;
	[self.snakeView addGestureRecognizer:gestureRecognizer2];
    
    UISwipeGestureRecognizer *gestureRecognizer3 = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipe:)];
	gestureRecognizer3.direction = UISwipeGestureRecognizerDirectionDown;
	[self.snakeView addGestureRecognizer:gestureRecognizer3];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.gameSateLabel.text = @"貪食蛇";
    self.gameSateLabel.hidden = NO;
    
    //加上手勢滑動
    [self addGestureRecognizerWithFourDerictions];
}

-(void)swipe:(UISwipeGestureRecognizer *)gestureRecognizer{
    switch (gestureRecognizer.direction) {
        case UISwipeGestureRecognizerDirectionRight:
            self.snake.direction = ALSnakeDirectionRight;
            break;
        case UISwipeGestureRecognizerDirectionLeft:
            self.snake.direction = ALSnakeDirectionLeft;
            break;
        case UISwipeGestureRecognizerDirectionUp:
            self.snake.direction = ALSnakeDirectionUp;
            break;
        case UISwipeGestureRecognizerDirectionDown:
            self.snake.direction = ALSnakeDirectionDown;
            break;
        default:
            break;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)startButtonPressed:(id)sender {
    self.startButton.hidden = YES;
    [self startGame];
}

-(void)startGame{
    self.gameSateLabel.hidden = YES;
    
    self.snakeView.layer.opacity = 1;
    
    //Pre-setup
    self.snake = nil;
    self.world = nil;
    self.snakeView.delegate = self;
    
    //Init
    self.world = [[ALSnakeWorld alloc] initWithSize:ALSnakeWorldSizeMake(ALSnakeWorldSizeWidth, ALSnakeWorldSizeHeight)];
    self.snake = [[ALSnake alloc] initWithWorld:self.world];
    
    [self.world makeFruit];
    
    //Run
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0/GameSpeed target:self selector:@selector(runOneRound) userInfo:nil repeats:YES];
    
    
}

-(void)runOneRound{
    if (!self.snake || !self.world) {
        //Error
        return;
    }
    
    
    [self.snake move];
    
    if (self.snake.isDead) {
        [self endGame];
        return;
    }
    
    [self.snakeView setNeedsDisplay];
}

-(void)endGame{
    [self.timer invalidate];
    self.timer = nil;
    
    self.gameSateLabel.text = @"GAME OVER";
    self.gameSateLabel.hidden = NO;
    
    self.startButton.hidden = NO;
    
    self.snakeView.layer.opacity = 0.1;
    
}

-(ALSnakeWorld *)snakeWorldForSnakeView:(ALSnakeView *)view{
    return self.world;
}

@end
