//
//  ViewController.m
//  OnBoardingIntroTour
//
//  Created by Arsalan Vakili on 2015-07-17.
//  Copyright (c) 2015 Arsalan Vakili. All rights reserved.
//

#import "ViewController.h"
#import "IFTTTJazzHands.h"
#import "TourViewController.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  
    
}


-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    TourViewController *tourViewController = [[TourViewController alloc]init];
    [self presentViewController:tourViewController animated:YES completion:nil];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
