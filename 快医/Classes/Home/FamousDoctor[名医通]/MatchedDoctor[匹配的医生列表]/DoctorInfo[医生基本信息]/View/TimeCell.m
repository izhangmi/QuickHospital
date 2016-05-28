//
//  TimeCell.m
//  快医
//
//  Created by bear on 16/5/13.
//  Copyright © 2016年 bear. All rights reserved.
//

#import "TimeCell.h"

@implementation TimeCell

- (void)awakeFromNib {
    // Initialization code

    self.backgroundColor=[UIColor colorWithRed:arc4random_uniform(255)/255.0 green:arc4random_uniform(255)/255.0 blue:arc4random_uniform(255)/255.0 alpha:1];;
}

@end
