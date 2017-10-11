//
//  RequestViewModel.h
//  LearnRAC
//
//  Created by WS on 2017/10/11.
//  Copyright © 2017年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ReactiveObjC/ReactiveObjC.h>

@interface RequestViewModel : NSObject<UITableViewDataSource>

@property (nonatomic, strong, readonly) RACCommand *requestCommand;

@property (nonatomic, strong, readwrite) NSArray *models;
@end
