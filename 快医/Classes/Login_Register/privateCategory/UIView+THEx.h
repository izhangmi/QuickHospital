//
//  UIView+ChangeFrame.h
//  test
//
//  Created by litianhao on 16/2/29.
//  Copyright © 2016年 litianhao. All rights reserved.
//


//快速修改或者获取 uiview的frame属性的某一个值
#import <UIKit/UIKit.h>


#define SCREEN_BOUNDS ([UIScreen mainScreen].bounds)


@interface UIView (THEx)

@property (nonatomic,assign) CGRect myFrame;
@property (nonatomic,assign) CGRect myBounds;
///原点 的X
@property (nonatomic,assign) CGFloat myX;
///原点 的Y
@property (nonatomic,assign) CGFloat myY;
///宽度
@property (nonatomic,assign) CGFloat myWidth;
///高度
@property (nonatomic,assign) CGFloat myHeight;
///中心点
@property (nonatomic,assign) CGPoint myCenter;
///中心点的X
@property (nonatomic,assign) CGFloat myCenterX;
///中心点的Y
@property (nonatomic,assign) CGFloat myCenterY;
///右下角的点
@property (nonatomic,assign,readonly) CGPoint myTailPoint;
///size
@property (nonatomic,assign) CGSize mySize;


- (void)th_settingCornerRadius:(CGFloat)cornerRadius BorderColor:(UIColor *)borderColor borderWidth:(CGFloat)borderWidth;

///中心点不变 缩放到指定size
-(void)scaleWithFixedCenterToSize:(CGSize)size;

/**
 *  返回给定frame的左上角的点
 */
+ (CGPoint)getLeftTopCornerPointWithFrame:(CGRect)frame;
/**
 *  返回给定frame的左下角的点
 */
+ (CGPoint)getLeftBottomCornerPointWithFrame:(CGRect)frame;
/**
 *  返回给定frame的右上角的点
 */
+ (CGPoint)getRightTopCornerPointWithFrame:(CGRect)frame;
/**
 *  返回给定frame的右下角的点
 */
+ (CGPoint)getRightBottomCornerPointWithFrame:(CGRect)frame;

- (void)shakeAnimationWithRotateAngle:(CGFloat)rotateAngle duration:(CGFloat)duration completionBlock:(void(^)(BOOL finished))completionBlock;

@end
