//
//  ViewController.m
//  LearnRAC
//
//  Created by mac on 16/4/10.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "ViewController.h"
#import "CalculatorMaker.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    CalculatorMaker *maker = [[CalculatorMaker alloc] init];
    
    BOOL result = [[[maker add:^NSInteger(NSInteger num) {
        num += 20;
        num += 10;
        return num;
    }] isEqualToResult:^BOOL(NSInteger num) {
        return num == 30;
    }] isEqualToResult];
    
    NSLog(@"%d",result);
    
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
