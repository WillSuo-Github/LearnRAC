//
//  LoginViewModel.m
//  LearnRAC
//
//  Created by WS on 2017/10/11.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "LoginViewModel.h"

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
}

@end
