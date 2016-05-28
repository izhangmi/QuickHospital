//
//  THExtensionForLoginSence.m
//  快医
//
//  Created by litianhao on 16/5/10.
//  Copyright © 2016年 bear. All rights reserved.
//

#import "THExtensionForLoginSence.h"

@implementation UIFloatLabelTextField (THExtensionForLoginSence)

+ (instancetype)th_TextFieldWith:(NSString *)placeholder leftIconName:(NSString *)leftIconName frame:(CGRect)frame
{
    CGFloat const leftViewMargin = 8 ;
    
    UIFloatLabelTextField *textField = [[UIFloatLabelTextField alloc] initWithFrame:frame];
    
    textField.placeholder = placeholder;
    textField.font = [UIFont systemFontOfSize:15];

    
    UIView *tempLeftView =  [[UIView alloc] initWithFrame:CGRectMake(0, 0, textField.myHeight, textField.myHeight)];
    
    UIImageView *iconView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:leftIconName]];
    iconView.contentMode = UIViewContentModeScaleAspectFit;
    iconView.frame = CGRectMake(leftViewMargin, leftViewMargin, tempLeftView.myWidth- 2*leftViewMargin, tempLeftView.myHeight - 2*leftViewMargin) ;
    
    
    [tempLeftView addSubview:iconView];
    textField.leftView = tempLeftView;


    
    textField.leftViewMode = UITextFieldViewModeAlways;
//    [textField th_settingCornerRadius:8 BorderColor:[UIColor lightGrayColor] borderWidth:1];

//    textField.layer.cornerRadius = 8;

    
    textField.layer.borderWidth=2;
    textField.layer.borderColor=COLOR(35, 189, 184, 1).CGColor;

    return textField;
    
}

@end

@implementation UIButton (THExtensionForLoginSence)

+ (instancetype)th_ButtonWithTitle:(NSString *)title frame:(CGRect)frame
{
    UIButton *btn = [[self alloc] initWithFrame:frame];
    btn.backgroundColor = [UIColor redColor];
    
    [btn setTitle:title forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:14];
    [btn th_settingCornerRadius:0 BorderColor:[UIColor lightGrayColor] borderWidth:0];

//     [btn th_settingCornerRadius:10 BorderColor:[UIColor lightGrayColor] borderWidth:0];

    [btn setBackgroundColor:COLOR(35, 189, 184, 1)];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    return btn;
}

@end

@implementation UILabel (THExtensionForLoginSence)

+ (UILabel *)th_LabelWithTitle:(NSString *)title frame:(CGRect)frame displayOnView:(UIView *)viewToAddOn
{
    CGFloat const infoBtnMargin = 6 ;
    UIButton *infoBtn =  [UIButton buttonWithType:UIButtonTypeInfoLight];
    infoBtn.frame = CGRectMake(frame.origin.x+ infoBtnMargin, frame.origin.y+infoBtnMargin, frame.size.height - 2*infoBtnMargin, frame.size.height - 2*infoBtnMargin);
    infoBtn.enabled = YES ;
    [viewToAddOn addSubview:infoBtn];
    
    UILabel *lbl = [[UILabel alloc] initWithFrame:CGRectMake(infoBtn.myTailPoint.x+3, frame.origin.y, frame.size.width - infoBtn.myWidth, frame.size.height)];
    lbl.font = [UIFont systemFontOfSize:16];
    lbl.text = title ;
    lbl.backgroundColor = CLEARCOLOR;
    lbl.textColor = [UIColor blackColor];
    [viewToAddOn addSubview:lbl];
    return lbl;
}

+ (void )th_LabelWithLeftTitle:(NSString *)leftTitle rightTitle:(NSString *)rightTitle frame:(CGRect)frame displayOnView:(UIView *)viewToAddOn
{
    CGFloat const leftLblW = 70 ;
    CGFloat const marginBetweenLeftAndRight = 10 ;
    CGRect leftLblFrame = CGRectMake(frame.origin.x, frame.origin.y, leftLblW, frame.size.height);
    UILabel *leftLbl = [[UILabel alloc] initWithFrame:leftLblFrame];

    leftLbl.text = leftTitle;
    leftLbl.font = [UIFont systemFontOfSize:16];
    leftLbl.textColor = [UIColor grayColor];
    [viewToAddOn addSubview:leftLbl];
    
    CGRect rightLblFrame = CGRectMake(frame.origin.x + leftLblW +marginBetweenLeftAndRight , frame.origin.y, frame.size.width - leftLblW, frame.size.height);
    UILabel *rightLbl = [[UILabel alloc] initWithFrame:rightLblFrame];
    rightLbl.text = rightTitle;
    rightLbl.font = [UIFont systemFontOfSize:16];
    [viewToAddOn addSubview:rightLbl];
}

@end
