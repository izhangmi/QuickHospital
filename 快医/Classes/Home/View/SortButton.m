//
//  SortButton.m
//  快医
//
//  Created by bear on 16/5/9.
//  Copyright © 2016年 bear. All rights reserved.
//

#import "SortButton.h"

#define kTitleRatio 0.3

@implementation SortButton


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // 1.文字居中
        self.titleLabel.textAlignment = NSTextAlignmentLeft;

        // 2.文字大小
        self.titleLabel.font = [UIFont systemFontOfSize:17];
        [self setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];

        // 3.图片的内容模式
        self.imageView.contentMode = UIViewContentModeCenter;
//
        [self setBackgroundImage:[UIImage imageNamed:@"sortsbtnBg-1"] forState:UIControlStateNormal];

        
//        self.layer.cornerRadius = 10;
//        self.layer.borderWidth=1;
        self.layer.borderColor=COLOR(35, 189, 184, 1).CGColor;

        
    }
    return self;
}

#pragma mark 覆盖父类在highlighted时的所有操作
- (void)setHighlighted:(BOOL)highlighted {
    [super setHighlighted:highlighted];
}

#pragma mark 调整内部ImageView的frame
- (CGRect)imageRectForContentRect:(CGRect)contentRect
{

    CGFloat imageX = 0;
    CGFloat imageY = 0;
    CGFloat imageWidth = contentRect.size.width*0.3;
    CGFloat imageHeight = contentRect.size.height ;
    return CGRectMake(imageX, imageY, imageWidth, imageHeight);
}

#pragma mark 调整内部UILabel的frame
- (CGRect)titleRectForContentRect:(CGRect)contentRect
{
    CGFloat titleX = contentRect.size.width*0.3;

    CGFloat titleHeight = contentRect.size.height;
    CGFloat titleY = 0;
    CGFloat titleWidth = contentRect.size.width*0.7;
    return CGRectMake(titleX, titleY, titleWidth, titleHeight);
}

@end
