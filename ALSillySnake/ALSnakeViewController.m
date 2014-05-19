//
//  ALSnakeViewController.m
//  ALSillySnake
//
//  Created by allenlin on 5/19/14.
//  Copyright (c) 2014 KKBOX. All rights reserved.
//

#import "ALSnakeViewController.h"

@interface ALSnakeViewController ()

#pragma UI
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UIButton *startButton;

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

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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

//-(void)startGame{
//    self.timer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(timerMethod:) userInfo:nil repeats:YES];
//}

//-(void)runOneRound{
//    self.timeLabel.text = [NSString stringWithFormat:@"time: %i",self.seconds];
//}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
