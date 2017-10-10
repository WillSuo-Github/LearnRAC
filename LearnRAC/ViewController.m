//
//  ViewController.m
//  LearnRAC
//
//  Created by mac on 16/4/10.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "ViewController.h"
#import "LoginViewController.h"
#import <ReactiveObjC/ReactiveObjC.h>


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
}

#pragma mark -
#pragma mark - action reponse
- (IBAction)loginButtonDidTapped:(id)sender {
    
    LoginViewController *loginVc = [[LoginViewController alloc] init];
    [self.navigationController pushViewController:loginVc animated:true];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
