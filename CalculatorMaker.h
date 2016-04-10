//
//  CalculatorMaker.h
//  LearnRAC
//
//  Created by mac on 16/4/10.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CalculatorMaker : NSObject

@property (nonatomic, assign) NSInteger result;

@property (nonatomic, assign) BOOL isEqualToResult;


- (instancetype)add:(NSInteger(^)(NSInteger num))block;

- (instancetype)isEqualToResult:(BOOL(^)(NSInteger num))block;
@end
