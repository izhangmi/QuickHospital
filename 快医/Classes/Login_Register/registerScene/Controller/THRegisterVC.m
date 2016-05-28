//
//  THRegisterVC.m
//  快医
//
//  Created by litianhao on 16/5/10.
//  Copyright © 2016年 bear. All rights reserved.
//

#import "THRegisterVC.h"
#import <TPKeyboardAvoidingScrollView.h>
#import "THExtensionForLoginSence.h"
#import "THRegisterConfirmVC.h"
 #import <SMS_SDK/SMSSDK.h>

@interface THRegisterVC ()

@property (nonatomic,strong) NSMutableDictionary *textFieldDictM;
@property (nonatomic, strong) NSMutableArray *textFliedArrM;
@property (nonatomic,weak) UIButton *agreeBtn;

@end

@implementation THRegisterVC

- (void)loadView
{
    self.view = [[TPKeyboardAvoidingScrollView alloc] init];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self settingWidgetsInEveryRow];
}


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self settingNaviBar];
}

- (void)settingNaviBar
{
    self.title = @"用户注册";


}


- (void)settingWidgetsInEveryRow
{
    CGFloat const verMargin = 40 ;
    CGFloat const horMargin = 10 ;
    CGFloat const rowHeight = 38 ;
    
    NSArray *inputTextFieldArr = @[
                                   @{@"请输入真实姓名" : @"u16"},
                                   @{@"请输入有效证件号码" : @"u20"},
                                   @{@"请输入现居地址"  : @"u86"},
                                   @{@"请输入手机号"  : @"u24"},
                                   @{@"请输入验证码" : @"u28"}
                                   ];
    
    [inputTextFieldArr enumerateObjectsUsingBlock:^(NSDictionary * _Nonnull dict, NSUInteger idx, BOOL * _Nonnull stop) {
        
        NSString *key =   dict.allKeys.lastObject;
        CGFloat textFieldWidth = SCREEN_WIDTH - 2*verMargin ;
        CGFloat textFieldY = horMargin + (horMargin + rowHeight)*idx ;
        if (idx == inputTextFieldArr.count - 1)
        {
            textFieldWidth *= 0.7 ;
         UIButton *tempBtn = [UIButton th_ButtonWithTitle:@"获取验证码" frame:CGRectMake(
                                                                                         verMargin + textFieldWidth + 6,
                                                                                         textFieldY,
                                                                                         SCREEN_WIDTH - 2*verMargin - textFieldWidth - 6,
                                                                                         rowHeight
                                                                                         )];
            tempBtn.titleLabel.font = [UIFont systemFontOfSize:16];
            [self.view addSubview:tempBtn];
            [tempBtn addTarget:self action:@selector(getVerifyCode) forControlEvents:UIControlEventTouchUpInside];
        }

        UITextField *tmpTF=[UIFloatLabelTextField th_TextFieldWith:key leftIconName:dict[key] frame:CGRectMake(
                                                                                                               verMargin,
                                                                                                               textFieldY,
                                                                                                               textFieldWidth,
                                                                                                               rowHeight)];
        [self.view addSubview: tmpTF];


        [self.textFliedArrM addObject:tmpTF];
    }];
    
    
    UIView *agreeContainerView = [[UIView alloc] initWithFrame:CGRectMake(
                                                                         verMargin,
                                                                         horMargin + (horMargin + rowHeight)*inputTextFieldArr.count,
                                                                         SCREEN_WIDTH - 2*verMargin,
                                                                          rowHeight)];

    [self.view addSubview:agreeContainerView];
    
    UIButton *agreeBtn = [[UIButton alloc] initWithFrame:CGRectMake(10, 10, agreeContainerView.myHeight - 20, agreeContainerView.myHeight - 20)];
    _agreeBtn = agreeBtn ;
    [agreeBtn addTarget:self action:@selector(agreeBtnClk:) forControlEvents:UIControlEventTouchUpInside];
    [agreeBtn setImage:[UIImage imageNamed:@"u113"] forState:UIControlStateNormal];
    [agreeContainerView addSubview:agreeBtn];
    
    UILabel *agreeLbl = [[UILabel alloc] init];
    agreeLbl.text = @"本人已阅读并同意用户协议" ;
    agreeLbl.textColor = [UIColor blackColor];
    [agreeLbl sizeToFit];
    agreeLbl.myX = agreeBtn.myTailPoint.x;
    agreeLbl.myCenterY = agreeBtn.myCenterY;
    [agreeContainerView addSubview:agreeLbl];
    
    agreeContainerView.myWidth = agreeBtn.myWidth + agreeLbl.myWidth  + 10;
    NSLog(@"%@",self.view);
    agreeContainerView.myCenterX = SCREEN_WIDTH/2;
    
    
    UIButton *nextStepBtn = [UIButton th_ButtonWithTitle:@"下一步" frame:CGRectMake( verMargin,
                                                                                   horMargin + (horMargin + rowHeight)*(inputTextFieldArr.count + 1),
                                                                                   SCREEN_WIDTH - 2*verMargin,
                                                                                   rowHeight)];
    nextStepBtn.titleLabel.font = [UIFont systemFontOfSize:18];
    
    [nextStepBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    nextStepBtn.layer.borderWidth = 0 ;
    [nextStepBtn addTarget:self action:@selector(nextBtnClk) forControlEvents:UIControlEventTouchUpInside];

    nextStepBtn.backgroundColor=COLOR(35, 189, 184, 1);
    [self.view addSubview:nextStepBtn];
}
- (void)nextBtnClk
{


    [SMSSDK commitVerificationCode:[self.textFliedArrM[4] text] phoneNumber:[self.textFliedArrM[3] text] zone:@"86" result:^(NSError *error) {


        dispatch_async(dispatch_get_main_queue(), ^{

            if (!error) {

                [self.navigationController pushViewController:[THRegisterConfirmVC new] animated:YES];
            }else{


                UIAlertView *alertV=[[UIAlertView alloc]initWithTitle:@"提示信息" message:@"验证码不正确" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];

                [alertV show];
                
            }
            
        });


    }];

}
- (void)agreeBtnClk:(UIButton *)sender
{
    sender.selected = !sender.selected;
}


-(void)getVerifyCode{

    [SMSSDK getVerificationCodeByMethod:SMSGetCodeMethodSMS phoneNumber:[self.textFliedArrM[3] text] zone:@"86" customIdentifier:nil result:^(NSError *error) {

        NSLog(@"-----%@",[self.textFliedArrM[3] text]);

        dispatch_async(dispatch_get_main_queue(), ^{

            if (!error) {

                UIAlertView *alertV=[[UIAlertView alloc]initWithTitle:@"提示信息" message:@"验证码已发送,请注意查收" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
                [alertV show];
            }else{


                UIAlertView *alertV=[[UIAlertView alloc]initWithTitle:@"提示信息" message:@"验证码发送失败" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
                [alertV show];
                
            }

        });



    }];
}




-(NSMutableArray *)textFliedArrM{
    if (!_textFliedArrM) {
        _textFliedArrM=[NSMutableArray array];

    }
    return _textFliedArrM;
}

@end
