//
//  THPopView.h
//  快医
//
//  Created by litianhao on 16/5/9.
//  Copyright © 2016年 bear. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface THPopView : UIView

+ (instancetype)popOut;
+ (void)hide ;
+ (void)setLoginOperationBlock:(void(^)(void))operationBlock;
+ (void)setRegisterOperationBlock:(void(^)(void))operationBlock;


@end
