//
//  Weather.h
//  快医
//
//  Created by bear on 16/5/13.
//  Copyright © 2016年 bear. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Weather : UIView



@property (nonatomic, weak) UINavigationController *parentNavVc;

@property (nonatomic, copy) void(^jump2VC)(UIViewController * targetVc);
@property (nonatomic, copy) NSString *city;

+(instancetype)weather;
@end
