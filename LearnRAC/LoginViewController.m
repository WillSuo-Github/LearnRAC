//
//  LoginViewController.m
//  LearnRAC
//
//  Created by WS on 2017/10/11.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "LoginViewController.h"
#import "LoginViewModel.h"
#import <MBProgressHUD_WJExtension/MBProgressHUD.h>

@interface LoginViewController ()

@property (nonatomic, strong) LoginViewModel *loginViewModel;
@property (weak, nonatomic) IBOutlet UITextField *usernameTF;
@property (weak, nonatomic) IBOutlet UITextField *passwordTF;
@property (weak, nonatomic) IBOutlet UIButton *loginButton;
@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self bindModel];
}

- (void)bindModel {
    RAC(self.loginViewModel, account) = _usernameTF.rac_textSignal;
    RAC(self.loginViewModel, pwd) = _passwordTF.rac_textSignal;
    RAC(self.loginButton, enabled) = self.loginViewModel.enableLoginSignal;
    
    [[_loginButton rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
        [self.loginViewModel.loginCommand execute:nil];
    }];
    
    
    [self.loginViewModel.loginCommand.executionSignals.switchToLatest subscribeNext:^(id  _Nullable x) {
        if ([x isEqualToString:@"登录成功"]) {
            NSLog(@"dengluchenggong");
        }
    }];
    
    [[self.loginViewModel.loginCommand.executing skip:1] subscribeNext:^(NSNumber * _Nullable x) {
        if ([x isEqualToNumber:@(true)]) {
            [self.view endEditing:true];
            [MBProgressHUD showHUDAddedTo:self.view animated:true];;
        }else{
            [MBProgressHUD hideHUDForView:self.view animated:true];
        }
    }];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"%@--%@", self.loginViewModel.account, self.loginViewModel.pwd);
}

#pragma mark -
#pragma mark - lazy
- (LoginViewModel *)loginViewModel {
    if (_loginViewModel == nil) {
        _loginViewModel = [[LoginViewModel alloc] init];
    }
    return _loginViewModel;
}

@end
