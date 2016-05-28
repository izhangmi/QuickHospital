//
//  THBuySeviceHeaderView.m
//  快医
//
//  Created by litianhao on 16/5/13.
//  Copyright © 2016年 bear. All rights reserved.
//

#import "THBuySeviceHeaderView.h"

@implementation THBuySeviceHeaderView

- (void)awakeFromNib
{
    [super awakeFromNib];
}
-(void)drawRect:(CGRect)rect
{

        UIBezierPath *linerPath = [UIBezierPath bezierPath];
        
        [linerPath moveToPoint:CGPointMake(0, self.height-1)];
        [linerPath addLineToPoint:CGPointMake(self.width-1, self.height-1)];
        
        linerPath.lineWidth = 0.7;
        
        [linerPath stroke];
        
}

@end
