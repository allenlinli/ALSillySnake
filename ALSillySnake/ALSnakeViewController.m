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

static NSTimeInterval const timerInterval = 0.5;

@interface ALSnakeViewController ()

#pragma UI
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UIButton *startButton;
@property (weak, nonatomic) IBOutlet UILabel *gameSateLabel;
@property (weak, nonatomic) IBOutlet ALSnakeView *snakeView;

#pragma Objects
@property (strong, nonatomic) ALSnakeWorld *world;

#pragma Time
@property (strong, nonatomic) NSTimer* timer;
@end

@implementation ALSnakeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.snakeView.delegate = self;
    self.gameSateLabel.text = @"貪食蛇";
    self.gameSateLabel.hidden = NO;
    
    for (NSNumber *v in @[@(UISwipeGestureRecognizerDirectionRight),
                          @(UISwipeGestureRecognizerDirectionLeft),
                          @(UISwipeGestureRecognizerDirectionUp),
                          @(UISwipeGestureRecognizerDirectionDown)]) {
        UISwipeGestureRecognizer *gestureRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipe:)];
        gestureRecognizer.direction = [v unsignedIntegerValue];
        [self.snakeView addGestureRecognizer:gestureRecognizer];
    }
}

-(void)swipe:(UISwipeGestureRecognizer *)gestureRecognizer
{
    NSDictionary *map = @{@(UISwipeGestureRecognizerDirectionRight): @(ALSnakeDirectionRight),
                          @(UISwipeGestureRecognizerDirectionLeft): @(ALSnakeDirectionLeft),
                          @(UISwipeGestureRecognizerDirectionUp): @(ALSnakeDirectionUp),
                          @(UISwipeGestureRecognizerDirectionDown): @(ALSnakeDirectionDown)};
    self.world.snake.direction = [map[@(gestureRecognizer.direction)] integerValue];
}

- (IBAction)startButtonPressed:(id)sender
{
    self.startButton.hidden = YES;
    [self startGame];
}

-(void)startGame
{
    self.gameSateLabel.hidden = YES;
    
    self.snakeView.alpha = 1;
    
    //Init
    self.world = [[ALSnakeWorld alloc] initWithSize:ALSnakeWorldSizeMake(ALSnakeWorldSizeWidth, ALSnakeWorldSizeHeight)];
    
    [self.world makeFruit];
    
    //Run
    self.timer = [NSTimer scheduledTimerWithTimeInterval:timerInterval target:self selector:@selector(runOneRound:) userInfo:nil repeats:YES];
}

-(void)runOneRound:(NSTimer *)timer
{
    if (!self.world) {
        //Error
        return;
    }
    
    [self.world.snake move];
    if (self.world.snake.isHeadHitBody) {
        [self endGame];
        return;
    }
    if ([self.world.snake isTouchingFruit:self.world.fruitPoint]) {
        [self.world.snake extendBodyWithLength:1];
        [self.world makeFruit];
    }
    
    [self.snakeView setNeedsDisplay];
}

-(void)endGame
{
    [self.timer invalidate];
    self.timer = nil;
    
    self.gameSateLabel.text = @"GAME OVER";
    self.gameSateLabel.hidden = NO;
    self.startButton.hidden = NO;
    self.snakeView.alpha = 0.1;
}

-(void)pauseGame
{
    
}
-(void)resumeGame
{
}

#pragma mark -

-(ALSnakeWorld *)snakeWorldForSnakeView:(ALSnakeView *)view
{
    return self.world;
}

@end
