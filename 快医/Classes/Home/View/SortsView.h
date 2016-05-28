//
//  SortsView.h
//  快医
//
//  Created by bear on 16/5/9.
//  Copyright © 2016年 bear. All rights reserved.
//

#import <UIKit/UIKit.h>



typedef void(^Jump2VC)(UIViewController * targetVc);

@interface SortsView : UIButton



@property (nonatomic, copy) void(^jump2VC)(UIViewController *targetVc);

@property (nonatomic,copy) UINavigationController*(^getNavigationControllerBlock)(void);

@end
