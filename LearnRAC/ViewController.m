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
#import "redView.h"

@interface ViewController ()

//@property (nonatomic, strong) RACCommand *command;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    RACSignal *hotSignal = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
//        NSLog(@"请求热门数据");
//        [subscriber sendNext:@"热门数据"];
//        return nil;
//    }];
//    
//    
//    RACSignal *recommendSignal = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
//        NSLog(@"请求推荐数据");
//        [subscriber sendNext:@"推荐数据"];
//        return nil;
//    }];
//    
//    [self rac_liftSelector:@selector(getHotData:recommendData:) withSignalsFromArray:@[hotSignal,recommendSignal]];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(100, 20, 100, 30)];
    [self.view addSubview:label];
    label.textColor = [UIColor greenColor];
    label.backgroundColor = [UIColor redColor];
    
    
    UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(100, 100, 100, 30)];
    [self.view addSubview:textField];
    textField.borderStyle = UITextBorderStyleLine;
    
    RAC(label,text) = textField.rac_textSignal;
//
//    [textField.rac_textSignal subscribeNext:^(id x) {
//        NSLog(@"%@",x);
//    }];
//    
//    [[[NSNotificationCenter defaultCenter] rac_addObserverForName:UIKeyboardWillShowNotification object:nil] subscribeNext:^(id x) {
//        NSLog(@"弹出键盘");
//    }];
    
    
//    UIButton *redBtn = [UIButton buttonWithType:UIButtonTypeCustom];
//    redBtn.backgroundColor = [UIColor redColor];
//    redBtn.frame = CGRectMake(100, 100, 100, 100);
//    [self.view addSubview:redBtn];
//    
//    [[redBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
//        NSLog(@"点击了红色btn");
//    }];
    
    
//    redView *red = [[redView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
//    [self.view addSubview:red];
//    
//    
//    [[red rac_signalForSelector:@selector(chick)] subscribeNext:^(id x) {
//        NSLog(@"主控制器监听到红色View的点击");
//    }];
}

- (void)getHotData:(NSString *)hotData recommendData:(NSString *)recommendData{
    
    
    NSLog(@"%@--%@",hotData,recommendData);
    NSLog(@"更新ui");
}


- (IBAction)chick:(id)sender {
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
