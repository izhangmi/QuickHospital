//
//  LeftMenuController.h
//  快医
//
//  Created by bear on 16/5/9.
//  Copyright © 2016年 bear. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LeftMenuController : UIViewController

@property (nonatomic, copy)  void(^jumpHandler)(UIViewController *);

@end
