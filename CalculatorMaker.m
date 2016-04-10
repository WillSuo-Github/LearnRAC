//
//  CalculatorMaker.m
//  LearnRAC
//
//  Created by mac on 16/4/10.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "CalculatorMaker.h"

@implementation CalculatorMaker

- (CalculatorMaker *(^)(NSInteger))add{
    
    return ^(NSInteger num){
        
        _result += num;
        
        return self;
    };
}


- (CalculatorMaker *)addNum:(NSInteger)num{
    
    _result += num;
    return self;
}

@end
