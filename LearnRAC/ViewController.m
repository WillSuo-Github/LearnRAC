//
//  ViewController.m
//  LearnRAC
//
//  Created by mac on 16/4/10.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "ViewController.h"
#import "CalculatorMaker.h"
#import "ReactiveCocoa.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    
    RACSignal *signal = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        [subscriber sendNext:@"111"];
        
        return [RACDisposable disposableWithBlock:^{
        
        }];
    }];
    
    [signal subscribeNext:^(id x) {
        NSLog(@"----%@",x);
    }];
    
    
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
