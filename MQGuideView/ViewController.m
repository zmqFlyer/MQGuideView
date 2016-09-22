//
//  ViewController.m
//  MQGuideView
//
//  Created by irs on 16/9/22.
//  Copyright © 2016年 zmq. All rights reserved.
//

#import "ViewController.h"
#import "MQGuideView.h"

@interface ViewController () <MQGuideViewDelegate>
@property (assign,nonatomic) BOOL isFirstLaunch;
@property (strong,nonatomic) MQGuideView *guideView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(100, 200, 100, 50)];
    [btn setTitle:@"这是首页" forState:UIControlStateNormal];
    btn.backgroundColor = [UIColor brownColor];
    [self.view addSubview:btn];
}

- (void)viewWillAppear:(BOOL)animated{
    if (![[NSUserDefaults standardUserDefaults] boolForKey:@"isFirstLaunch"]) {
        _isFirstLaunch = YES;
        [[NSUserDefaults standardUserDefaults] setBool:_isFirstLaunch forKey:@"isFirstLaunch"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        _guideView = [[MQGuideView alloc]initWithFrame:[UIScreen mainScreen].bounds];
        _guideView.delegate = self;
        [self.view addSubview:_guideView];
    }
}

- (void)onPassButtonPressed{
    [UIView animateWithDuration:1.0 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
       _guideView.alpha = 0;
    } completion:^(BOOL finished) {
        [_guideView removeFromSuperview];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
