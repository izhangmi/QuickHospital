//
//  UIImage+CC.h
//  hedaAssistant
//
//  Created by bear on 16/5/2.
//  Copyright © 2016年 bear. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (CC)

//用颜色渲染图片
- (UIImage *) tintImageWithColor:(UIColor *)tintColor;

//用颜色生成一个   1*1   的图片
+ (UIImage *)imageWithColor:(UIColor *)color;


//用颜色生成一个   自定义大小   的图片
+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size;


@end
