//
//  ViewController.m
//  LearnRAC
//
//  Created by mac on 16/4/10.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "ViewController.h"
#import "RequestViewModel.h"
#import <ReactiveObjC/ReactiveObjC.h>


@interface ViewController ()

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) RequestViewModel *requestViewModel;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    _tableView.dataSource = self.requestViewModel;
    [self.view addSubview:_tableView];
    
}

#pragma mark -
#pragma mark - action reponse
- (IBAction)buttonDidTapped:(id)sender {
    RACSignal *requestSignal = [self.requestViewModel.requestCommand execute:@"start"];
    [requestSignal subscribeNext:^(NSArray *x) {
        self.requestViewModel.models = x;
        [self.tableView reloadData];
    }];
}



#pragma mark -
#pragma mark - lazy
- (RequestViewModel *)requestViewModel {
    if (_requestViewModel == nil) {
        _requestViewModel = [[RequestViewModel alloc] init];
    }
    return _requestViewModel;
}

@end
