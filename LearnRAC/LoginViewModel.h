//
//  LoginViewModel.h
//  LearnRAC
//
//  Created by WS on 2017/10/11.
//  Copyright © 2017年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ReactiveObjC/ReactiveObjC.h>

@interface LoginViewModel : NSObject

@property (nonatomic, copy) NSString *account;
@property (nonatomic, copy) NSString *pwd;

@property (nonatomic, strong) RACSignal *enableLoginSignal;
@end
