//
//  THChatMessageBtn.m
//  快医
//
//  Created by litianhao on 16/5/12.
//  Copyright © 2016年 bear. All rights reserved.
//

#import "THChatMessageBtn.h"

@interface THChatMessageBtn ()

@property (nonatomic,weak) UIImageView *imagV;

@end

@implementation THChatMessageBtn


- (void)drawRect:(CGRect)rect
{
    
    CGContextRef ctx = UIGraphicsGetCurrentContext() ;
    CGContextSetLineWidth(ctx, 2);
    [COLOR(35, 189, 184, 0.6)  set];

    CGFloat const kaikouWidth = 15 ;
    CGFloat const kaikouLength = MIN(self.height/3, 20);
    CGFloat const kaikouStart = 10 ;

    if (_directionIsLeft) {
        CGPoint points[] = { CGPointMake(kaikouWidth, kaikouStart),
                                            CGPointMake(0, kaikouLength/2 + kaikouStart),
                                            CGPointMake(kaikouWidth, kaikouStart + kaikouLength) ,
                                            CGPointMake(kaikouWidth , self.height - 3) ,
                                            CGPointMake(self.width - kaikouWidth, self.height - 3) ,
                                            CGPointMake(self.width - kaikouWidth, 3) ,
                                            CGPointMake(kaikouWidth, 3) ,
                                            CGPointMake(kaikouWidth, kaikouStart)};
        CGContextAddLines(ctx, points, sizeof(points)/sizeof(CGPoint));
        CGContextStrokePath(ctx);
        return ;
    }

    CGPoint points[] ={ CGPointMake(self.width - kaikouWidth, kaikouStart),
                                        CGPointMake(self.width, kaikouLength/2 + kaikouStart),
                                        CGPointMake(self.width - kaikouWidth, kaikouStart + kaikouLength) ,
                                        CGPointMake(self.width - kaikouWidth , self.height - 3) ,
                                        CGPointMake(kaikouWidth, self.height - 3) ,
                                        CGPointMake(kaikouWidth, 3) ,
                                        CGPointMake(self.width - kaikouWidth, 3) ,
                                        CGPointMake(self.width - kaikouWidth, kaikouStart)};
    CGContextAddLines(ctx, points, sizeof(points)/sizeof(CGPoint));
    CGContextStrokePath(ctx);

}

- (void)setMessageImg:(UIImage *)messageImg
{
    _messageImg = messageImg ;
    if (messageImg) {
        CGRect imgFrame ;
        UIImageView *imgV = [[UIImageView alloc] initWithImage:messageImg];
        _imagV = imgV ;
        [imgV sizeToFit];
        imgFrame.size = imgV.frame.size ;
        imgFrame.origin.x = self.width/2 - imgV.width/2 ;
        imgFrame.origin.y = 10 ;
        imgV.frame = imgFrame ;
        [self addSubview:imgV];
        [self setNeedsDisplay];
    }else
    {
        [_imagV removeFromSuperview];
    }

    
}

- (CGRect)titleRectForContentRect:(CGRect)contentRect
{
    UIEdgeInsets insets = self.contentEdgeInsets ;
    return CGRectMake(insets.left, _messageImg.size.height , self.width - insets.left-insets.right, self.height - _messageImg.size.height + 10);
}

- (void)setDirectionIsLeft:(BOOL)directionIsLeft
{
    _directionIsLeft = directionIsLeft ;
    [self setNeedsDisplay];
}

@end
