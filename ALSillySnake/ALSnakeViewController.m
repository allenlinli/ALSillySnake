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

@interface ALSnakeViewController ()

#pragma UI
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UIButton *startButton;

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
- (IBAction)segmentControllerPressed:(id)sender {
    
}



- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // for testing
    [self startButtonPressed:nil];
    
    //加上手勢滑動
    UISwipeGestureRecognizer *gestureRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipe:)];
	gestureRecognizer.direction = UISwipeGestureRecognizerDirectionRight | UISwipeGestureRecognizerDirectionLeft | UISwipeGestureRecognizerDirectionUp | UISwipeGestureRecognizerDirectionDown;
	[self.snakeView addGestureRecognizer:gestureRecognizer];
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
    
    //Pre-setup
    self.snake = nil;
    self.world = nil;
    self.snakeView.delegate = self;
    
    //Init
    self.world = [[ALSnakeWorld alloc] initWithSize:ALSnakeWorldSizeMake(40, 40)];
    self.snake = [[ALSnake alloc] initWithWorld:self.world length:3];
    
    //uncomplete
    self.timer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(runOneRound) userInfo:nil repeats:YES];
    
}

-(void)runOneRound{
    if (!self.snake || !self.world) {
        //Error
        return;
    }
    
    if (self.snake.isDead) {
        [self endGame];
        return;
    }
    
    [self.snake move];
    
    NSValue *value = self.snake.bodyPoints[0];
    ALSnakeWorldPoint head = [value snakeWorldPointWithValue];
    
    
    [self.snakeView setNeedsDisplay];
}

-(ALSnakeWorld *)snakeWorldForSnakeView:(ALSnakeView *)view{
    return self.world;
}

@end
