//
//  ALSnakeViewControllerTest.m
//  ALSillySnake
//
//  Created by allenlin on 5/19/14.
//  Copyright (c) 2014 KKBOX. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "ALSnakeViewController.h"

@interface ALSnakeViewControllerTest : XCTestCase
@property (strong, nonatomic) ALSnakeViewController *controller;
@end

@implementation ALSnakeViewControllerTest

- (void)setUp
{
    [super setUp];
    
    self.controller = [[ALSnakeViewController alloc] init];
    
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    self.controller = nil;
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

//- (void)testStartGame
//{
//    [self.controller startGame];
//}

@end
