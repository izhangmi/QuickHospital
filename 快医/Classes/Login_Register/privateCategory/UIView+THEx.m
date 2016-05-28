//
//  UIView+ChangeFrame.m
//  test
//
//  Created by litianhao on 16/2/29.
//  Copyright © 2016年 litianhao. All rights reserved.
//

#import "UIView+THEx.h"

@implementation UIView (THEx)

- (void)th_settingCornerRadius:(CGFloat)cornerRadius BorderColor:(UIColor *)borderColor borderWidth:(CGFloat)borderWidth
{
    self.layer.masksToBounds = YES ;
    self.layer.cornerRadius = cornerRadius ;
    self.layer.borderColor = borderColor.CGColor ;
    self.layer.borderWidth = borderWidth ;
}

-(void)scaleWithFixedCenterToSize:(CGSize)size{
    CGRect frame = self.frame;
    CGPoint center = self.center;
    frame.size = size ;
    self.frame = frame;
    self.center = center ;
}

-(CGRect)myFrame{
    return self.frame;
}
-(void)setMyFrame:(CGRect)myFrame{
    self.frame = myFrame;
}

-(CGRect)myBounds{
    return self.bounds;
}

-(void)setMyBounds:(CGRect)myBounds{
    self.bounds = myBounds;
}

-(CGFloat)myX{
    return self.frame.origin.x;
}

-(void)setMyX:(CGFloat)myX{
    CGRect frame = self.frame ;
    frame.origin.x = myX;
    self.frame = frame;
}

-(CGFloat)myY{
    return self.frame.origin.y;
}

-(void)setMyY:(CGFloat)myY{
    CGRect frame = self.frame ;
    frame.origin.y = myY;
    self.frame = frame;
}

-(CGFloat)myWidth{
    return self.frame.size.width;
}

-(void)setMyWidth:(CGFloat)myWidth{
    CGRect frame = self.frame;
    frame.size.width = myWidth;
    self.frame = frame;
}

-(CGFloat)myHeight{
    return self.frame.size.height;
}

-(void)setMyHeight:(CGFloat)myHeight{
    CGRect frame = self.frame;
    frame.size.height = myHeight;
    self.frame = frame;
}

-(CGPoint)myCenter{
    return self.center;
}

-(void)setMyCenter:(CGPoint)myCenter{
    CGPoint p = self.center;
    p.x = myCenter.x;
    p.y = myCenter.y;
    self.center = p;
}

-(CGFloat)myCenterX{
    return self.center.x;
}

-(void)setMyCenterX:(CGFloat)myCenterX{
    CGPoint p = self.center;
    p.x = myCenterX;
    self.center = p;
}

-(CGFloat)myCenterY{
    return self.center.y;
}

-(void)setMyCenterY:(CGFloat)myCenterY{
    CGPoint p = self.center;
    p.y = myCenterY;
    self.center = p;
}

-(CGPoint)myTailPoint{
    CGPoint p = CGPointMake(self.frame.origin.x + self.frame.size.width, self.frame.origin.y + self.frame.size.height);
    return p;
}

-(CGSize)mySize{
    return self.frame.size;
}
-(void)setMySize:(CGSize)mySize{
    CGRect frame = self.frame;
    frame.size = mySize;
    self.frame = frame;
}


+ (CGPoint)getLeftTopCornerPointWithFrame:(CGRect)frame
{
    return CGPointMake(frame.origin.x, frame.origin.y);
}

+ (CGPoint)getLeftBottomCornerPointWithFrame:(CGRect)frame
{
    CGFloat originX = frame.origin.x;
    CGFloat originY = frame.origin.y ;
    CGFloat H = frame.size.height;
    return CGPointMake(originX, originY + H);
}

+ (CGPoint)getRightTopCornerPointWithFrame:(CGRect)frame
{
    CGFloat originX = frame.origin.x;
    CGFloat originY = frame.origin.y ;
    CGFloat W = frame.size.width;
    
    return CGPointMake( originX + W, originY);
}

+ (CGPoint)getRightBottomCornerPointWithFrame:(CGRect)frame
{
    CGFloat originX = frame.origin.x;
    CGFloat originY = frame.origin.y ;
    CGFloat W = frame.size.width;
    CGFloat H = frame.size.height;
    return CGPointMake(  originX + W, originY + H);
}

- (void)shakeAnimationWithRotateAngle:(CGFloat)rotateAngle duration:(CGFloat)duration completionBlock:(void (^)(BOOL))completionBlock
{
    [UIView animateWithDuration:duration animations:^{
        self.transform = CGAffineTransformMakeRotation(rotateAngle);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:duration animations:^{
            self.transform = CGAffineTransformMakeRotation(-rotateAngle);
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:duration/2 animations:^{
                self.transform = CGAffineTransformIdentity;
            } completion:^(BOOL finished) {
                if (completionBlock) {
                    completionBlock(finished);
                }
            }];
        }];
    }];

}

@end
