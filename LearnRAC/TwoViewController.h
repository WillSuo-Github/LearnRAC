//
//  TwoViewController.h
//  LearnRAC
//
//  Created by mac on 16/4/10.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ReactiveCocoa.h"

@interface TwoViewController : UIViewController

@property (nonatomic, strong) RACSubject *subject;

@end
