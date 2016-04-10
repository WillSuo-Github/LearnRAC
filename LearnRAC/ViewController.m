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
#import "TwoViewController.h"

@interface ViewController ()

//@property (nonatomic, strong) RACCommand *command;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    
    RACCommand *command = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
        NSLog(@"%@",input);
        
        return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
            
            [subscriber sendNext:@"发出信号"];
            return nil;
        }];
        
    }];
    
    
    [command.executionSignals subscribeNext:^(id x) {
//        NSLog(@"%@",x);
        [x subscribeNext:^(id x) {
            NSLog(@"%@",x);
        }];
    }];
    
    
    [command execute:@"1"];
    
}


- (IBAction)chick:(id)sender {
    
    
//    RACReplaySubject *subject = [RACReplaySubject subject];
//    
//    [subject sendNext:@"111"];
//    [subject subscribeNext:^(id x) {
//        NSLog(@"第一个订阅者%@",x);
//    }];
//    
//    [subject subscribeNext:^(id x) {
//        NSLog(@"第二个订阅者%@",x);
//    }];
    
    
    
//    [subject sendNext:@"222"];
    
    
    RACSubject *signalOfSignals = [RACSubject subject];
    
    RACSubject *signal = [RACSubject subject];
    
    
    [signalOfSignals subscribeNext:^(id x) {
        NSLog(@"%@",x);
        [x subscribeNext:^(id x) {
            NSLog(@"---%@",x);
        }];
    }];
    
    
    [signal subscribeNext:^(id x) {
        NSLog(@"%@",x);
    }];
    
    [signalOfSignals sendNext:signal];
    
    [signal sendNext:@"signal"];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
