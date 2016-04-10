//
//  CalculatorMaker.m
//  LearnRAC
//
//  Created by mac on 16/4/10.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "CalculatorMaker.h"

@implementation CalculatorMaker

- (instancetype)add:(NSInteger(^)(NSInteger))block{
    
    _result = block(_result);
    
    return self;
}

- (instancetype)isEqualToResult:(BOOL (^)(NSInteger))block{
    
    _isEqualToResult = block(_result);
    
    return self;
}

@end
