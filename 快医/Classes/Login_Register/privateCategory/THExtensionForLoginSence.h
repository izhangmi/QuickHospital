//
//  THExtensionForLoginSence.h
//  快医
//
//  Created by litianhao on 16/5/10.
//  Copyright © 2016年 bear. All rights reserved.
//


#import "UIFloatLabelTextField.h"
#import "UIView+THEx.h"


@interface UIFloatLabelTextField (THExtensionForLoginSence)

+ (instancetype)th_TextFieldWith:(NSString *)placeholder leftIconName:(NSString *)leftIconName frame:(CGRect)frame;


@end


@interface UIButton (THExtensionForLoginSence)

+ (instancetype)th_ButtonWithTitle:(NSString *)title frame:(CGRect)frame;

@end



@interface UILabel (THExtensionForLoginSence)

+ (UILabel *)th_LabelWithTitle:(NSString *)title frame:(CGRect)frame displayOnView:(UIView*)viewToAddOn;

+ (void)th_LabelWithLeftTitle:(NSString *)leftTitle rightTitle:(NSString *)rightTitle frame:(CGRect)frame displayOnView:(UIView *)viewToAddOn;

@end