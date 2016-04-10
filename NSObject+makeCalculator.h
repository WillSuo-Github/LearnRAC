//
//  NSObject+makeCalculator.h
//  LearnRAC
//
//  Created by mac on 16/4/10.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CalculatorMaker.h"

@interface NSObject (makeCalculator)


+ (NSInteger)makeCalculator:(void(^)(CalculatorMaker *make))makeBlock;



@end
