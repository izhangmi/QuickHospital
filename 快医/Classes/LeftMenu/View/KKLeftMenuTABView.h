//
//  KKLeftMenuTABView.h
//  快医
//
//  Created by 柯平常 on 16/5/9.
//  Copyright © 2016年 bear. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef  void(^chectUpdateBlock)(UIAlertController *alertVC);


@interface KKLeftMenuTABView : UITableView

@property (nonatomic, copy) NSString *settingPlistName;
@property (nonatomic, copy) chectUpdateBlock chectUpdateBlock;

@property (nonatomic, copy) void(^jump2VC)(UIViewController * targetVc);


//-(void)jumpToVc:(JumpBlock) jumpBlock;

@end
