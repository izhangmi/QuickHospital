//
//  THBookDetailView.m
//  快医
//
//  Created by litianhao on 16/5/11.
//  Copyright © 2016年 bear. All rights reserved.
//

#import "THBookDetailBackgroundView.h"

@implementation THBookDetailBackgroundView

- (NSMutableArray *)indicatorLineY
{
    if (!_indicatorLineY) {
        _indicatorLineY = [NSMutableArray array];
    }
    return _indicatorLineY;
}

- (void)drawRect:(CGRect)rect
{
    [COLOR(35, 189, 184, 0.6) set];
    
    [self.indicatorLineY enumerateObjectsUsingBlock:^(NSNumber  _Nonnull *y, NSUInteger idx, BOOL * _Nonnull stop) {
        UIBezierPath *liner = [UIBezierPath bezierPath];
        [liner moveToPoint:CGPointMake(0, y.doubleValue)];
        [liner addLineToPoint:CGPointMake(SCREEN_WIDTH, y.doubleValue)];
        [liner stroke];
    }];
   
}

@end

