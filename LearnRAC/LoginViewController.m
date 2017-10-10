//
//  LoginViewController.m
//  LearnRAC
//
//  Created by WS on 2017/10/11.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "LoginViewController.h"
#import "LoginViewModel.h"

@interface LoginViewController ()

@property (nonatomic, strong) LoginViewModel *loginViewModel;
@property (weak, nonatomic) IBOutlet UITextField *usernameTF;
@property (weak, nonatomic) IBOutlet UITextField *passwordTF;
@property (weak, nonatomic) IBOutlet UIButton *loginButton;
@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    RAC(self.loginViewModel, account) = _usernameTF.rac_textSignal;
    RAC(self.loginViewModel, pwd) = _passwordTF.rac_textSignal;
    
    RAC(self.loginButton, enabled) = self.loginViewModel.enableLoginSignal;
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
