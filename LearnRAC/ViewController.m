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

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
//    NSArray *arr = @[@1,@2,@3];
//    
//    [arr.rac_sequence.signal subscribeNext:^(id x) {
//        NSLog(@"%@",x[1]);
//    }];
    
//    NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:@"1",@"a",@"2",@"b",@"3",@"c", nil];
//    [dict.rac_sequence.signal subscribeNext:^(id x) {
////        NSLog(@"%@",x[1]);
//        RACTupleUnpack(NSString *key,id value) = x;
//        
//        NSLog(@"%@,%@",key,value);
//    }];
    
    
    
    
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
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
