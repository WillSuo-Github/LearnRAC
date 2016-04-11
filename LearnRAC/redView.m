//
//  redView.m
//  LearnRAC
//
//  Created by ws on 16/4/11.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "redView.h"

@implementation redView

- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame: frame]) {
        
        [self setUpSubView];
    }
    return self;
}

- (void)setUpSubView{
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.backgroundColor = [UIColor orangeColor];
    btn.frame = self.bounds;
    [self addSubview:btn];
    
    [btn addTarget:self action:@selector(chick) forControlEvents:UIControlEventTouchUpInside];
    
}


- (void)chick{
    
    NSLog(@"红色view点击了btn");
}
@end
