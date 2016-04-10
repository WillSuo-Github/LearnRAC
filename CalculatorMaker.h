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


- (CalculatorMaker *(^)(NSInteger num))add;

- (CalculatorMaker *)addNum:(NSInteger)num;
@end
