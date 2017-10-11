//
//  RequestViewModel.m
//  LearnRAC
//
//  Created by WS on 2017/10/11.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "RequestViewModel.h"
#import <AFNetworking/AFNetworking.h>
#import <MBProgressHUD_WJExtension/MBProgressHUD.h>

@implementation RequestViewModel

- (instancetype)init {
    if (self = [super init]) {
        [self initialBind];
    }
    return self;
}

- (void)initialBind {
    _requestCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal * _Nonnull(id  _Nullable input) {
        NSLog(@"%@", input);
        
        RACSignal *requestSignal = [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
            NSLog(@"开始网络请求");
            NSDictionary *params = @{@"q": @"基础"};
            [[AFHTTPSessionManager manager] GET:@"https://api.douban.com/v2/book/search" parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                NSLog(@"%@", responseObject);
                [subscriber sendNext:responseObject];
                [subscriber sendCompleted];
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                NSLog(@"请求失败");
            }];
            
            
            return nil;
        }];
        
        return [requestSignal map:^id _Nullable(id  _Nullable value) {
            NSMutableArray *dictArr = value[@"books"];
        
            NSArray *modelArr = [[dictArr.rac_sequence map:^id(id value) {
                NSLog(@"%@", value);
                return value;
            }] array];
            
            return modelArr;
        }];
    }];
    
    [[_requestCommand.executing skip:1] subscribeNext:^(NSNumber * _Nullable x) {
        if ([x isEqualToNumber:@(true)]) {
            [MBProgressHUD showHUDAddedTo:[UIApplication sharedApplication].keyWindow animated:true];
        }else{
            [MBProgressHUD hideHUDForView:[UIApplication sharedApplication].keyWindow animated:true];
        }
    }];
    
    [_requestCommand.executionSignals.switchToLatest subscribeNext:^(id  _Nullable x) {
        NSLog(@"完成:%@", x);
    }];
}


#pragma mark -
#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.models.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = self.models[indexPath.row][@"title"];
    return cell;
}

@end
