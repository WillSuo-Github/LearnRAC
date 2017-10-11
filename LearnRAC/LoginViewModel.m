//
//  LoginViewModel.m
//  LearnRAC
//
//  Created by WS on 2017/10/11.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "LoginViewModel.h"
#import <MBProgressHUD_WJExtension/MBProgressHUD+WJExtension.h>

@interface LoginViewModel ()
@property (nonatomic, strong) MBProgressHUD *hud;
@end

@implementation LoginViewModel

- (instancetype)init {
    if (self = [super init]) {
        [self initialBind];
    }
    return self;
}

- (void)initialBind {
    _enableLoginSignal = [RACSignal combineLatest:@[RACObserve(self, account), RACObserve(self, pwd)]reduce:^id (NSString *account, NSString *pwd){
        return @(account.length > 3 && pwd.length > 3);
    }];
    
    _loginCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal * _Nonnull(id  _Nullable input) {
        return [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [subscriber sendNext:@"登录成功"];
                [subscriber sendCompleted];
            });
            return nil;
        }];
    }];
    
    [_loginCommand.executionSignals.switchToLatest subscribeNext:^(id  _Nullable x) {
        if ([x isEqualToString:@"登录成功"]) {
            NSLog(@"dengluchenggong");
        }
    }];
    
    [[_loginCommand.executing skip:1] subscribeNext:^(NSNumber * _Nullable x) {
        if ([x isEqualToNumber:@(true)]) {
            [MBProgressHUD showHUDAddedTo:[UIApplication sharedApplication].keyWindow animated:true];;
        }else{
            [MBProgressHUD hideHUDForView:[UIApplication sharedApplication].keyWindow animated:true];
        }
    }];
}

#pragma mark -
#pragma mark - lazy
- (MBProgressHUD *)hud {
    if (_hud == nil) {
        _hud = [[MBProgressHUD alloc] initWithWindow:[UIApplication sharedApplication].keyWindow];
        _hud.labelText = @"正在登录...";
    }
    return _hud;
}

@end
