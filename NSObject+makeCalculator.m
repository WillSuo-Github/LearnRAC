//
//  NSObject+makeCalculator.m
//  LearnRAC
//
//  Created by mac on 16/4/10.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "NSObject+makeCalculator.h"

@implementation NSObject (makeCalculator)

//+ (NSInteger)makeCalcula

+ (NSInteger)makeCalculator:(void (^)(CalculatorMaker *))makeBlock{
    
    CalculatorMaker *maker = [[CalculatorMaker alloc] init];
    
    makeBlock(maker);
    
    return maker.result;
}

@end
