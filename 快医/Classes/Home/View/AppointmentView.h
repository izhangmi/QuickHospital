//
//  AppointmentView.h
//  快医
//
//  Created by bear on 16/5/9.
//  Copyright © 2016年 bear. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface AppointmentView : UIView



+(instancetype)appointmentViewWithFrame:(CGRect )frame;


@property (nonatomic, copy) void(^jump2VC)(UIViewController * targetVc);

@end
