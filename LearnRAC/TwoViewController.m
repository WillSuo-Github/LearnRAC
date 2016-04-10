//
//  TwoViewController.m
//  LearnRAC
//
//  Created by mac on 16/4/10.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "TwoViewController.h"

@implementation TwoViewController


- (void)viewDidLoad{
    
    [super viewDidLoad];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:btn];
    btn.frame = CGRectMake(100, 100, 100, 100);
    btn.backgroundColor = [UIColor redColor];
    [btn addTarget:self action:@selector(btnChick) forControlEvents:UIControlEventTouchUpInside];
}


- (void)btnChick{
    
    if (self.subject) {
        [self.subject sendNext:@"我要通知你了"];
    }
}

@end
