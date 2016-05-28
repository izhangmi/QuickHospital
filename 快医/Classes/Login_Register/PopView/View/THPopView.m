//
//  THPopView.m
//  快医
//
//  Created by litianhao on 16/5/9.
//  Copyright © 2016年 bear. All rights reserved.
//

#import "THPopView.h"
#import "UIView+THEx.h"
#import "UIImage+CC.h"
#import "THLoginVC.h"
#import "UIView+Explode.h"

static THPopView *popView = nil ;
static dispatch_once_t once_token ;

@interface THPopView ()

@property (nonatomic,copy) void(^LoginClkBlock)(void);
@property (nonatomic,copy) void(^registerClkBlock)(void);
@property (nonatomic,weak) UIView *promptView;

@end

@implementation THPopView

+ (instancetype)sharePopView
{
    dispatch_once(&once_token, ^{
        popView = [[THPopView alloc] init ];
        HMLog(@"alloc");
    });
    return popView ;
}

+ (instancetype)popOut
{
    THPopView *tempPopView = [self sharePopView];
    tempPopView.frame =  [UIScreen mainScreen].bounds ;
    tempPopView.backgroundColor = [UIColor colorWithWhite:0 alpha:0.6];
    [[UIApplication sharedApplication].keyWindow addSubview:tempPopView];

    return popView;
}

- (instancetype)init
{
    if (self = [super init]) {
    }
    return self ;
}

- (void)layoutSubviews
{
    [self p_settingPromptView];
}
- (void)p_settingPromptView
{
    CGFloat const imageViewBorderLength = 100 ;
    CGFloat const margin = 10 ;
    CGFloat const btnH = 30 ;

    
    UIView *promptView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 250, 170) ];

    promptView.backgroundColor = [UIColor whiteColor];
    promptView.center = CGPointMake(CGRectGetMidX(self.bounds), CGRectGetMidY(self.bounds));
//    promptView.layer.contents=(__bridge id _Nullable)([UIImage imageNamed:@"sortsbtnBg-1"].CGImage);

    promptView.layer.borderWidth=5;
    promptView.layer.borderColor=COLOR(35, 189, 184, 1).CGColor;
//    [promptView th_settingCornerRadius:18 BorderColor:[UIColor grayColor] borderWidth:1];

    [self addSubview:promptView];
    _promptView = promptView ;

    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(
                                                                          (promptView.myWidth - imageViewBorderLength)/2+5,
                                                                          margin+5,
                                                                          imageViewBorderLength-10,
                                                                          imageViewBorderLength-10)];
    imageView.image = [UIImage imageNamed:@"user_default"];
    imageView.layer.cornerRadius = imageView.myWidth/2;
    imageView.layer.masksToBounds = YES ;

    [promptView addSubview:imageView];
    
    
    UIImage *blackImg = [UIImage imageWithColor:[UIColor colorWithWhite:0.3 alpha:1]];
    
    UIButton *loginBtn = [[UIButton alloc] initWithFrame:CGRectMake(margin, imageView.myTailPoint.y+ margin , (promptView.myWidth- 3*margin)/2 , btnH)];
    [loginBtn th_settingCornerRadius:8 BorderColor:[UIColor blackColor] borderWidth:0.8];

    [loginBtn setTitle:@"登录" forState:UIControlStateNormal];

    [loginBtn setBackgroundColor:[UIColor whiteColor]];
    [loginBtn setBackgroundImage:blackImg forState:UIControlStateHighlighted];
    
    [loginBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    [loginBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [loginBtn addTarget:self action:@selector(loginBtnClk) forControlEvents:UIControlEventTouchUpInside];
    [promptView addSubview:loginBtn];
    
    
    UIButton *registerBtn = [[UIButton alloc] initWithFrame:CGRectMake(loginBtn.myTailPoint.x + margin , imageView.myTailPoint.y + margin , (promptView.myWidth- 3*margin)/2, btnH)];
    [registerBtn th_settingCornerRadius:8 BorderColor:[UIColor blackColor] borderWidth:0.8];

    [registerBtn setTitle:@"注册" forState:UIControlStateNormal];
    [registerBtn setBackgroundImage:blackImg forState:UIControlStateHighlighted];
    [registerBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    [registerBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [registerBtn setBackgroundColor:[UIColor whiteColor]];
    [registerBtn addTarget:self action:@selector(registerBtnClk) forControlEvents:UIControlEventTouchUpInside];
    [promptView addSubview:registerBtn];
    
    promptView.bounds = CGRectZero;
    [UIView animateWithDuration:0.5 delay:0 usingSpringWithDamping:0.5 initialSpringVelocity:1/1.5 options:0 animations:^{
        promptView.bounds =CGRectMake(0, 0, 250, 170) ;
    } completion:nil];

}

- (void)loginBtnClk
{
    self.backgroundColor = [UIColor clearColor];
    self.promptView.layer.borderWidth = 0 ;
    [self.promptView lp_explodeWithDuration:1 ];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        if (self.LoginClkBlock) {
            self.LoginClkBlock();
        }
        [self.class hide];
    });
  

}

- (void)registerBtnClk
{
    self.backgroundColor = [UIColor clearColor];
    self.promptView.layer.borderWidth = 0 ;
    [self.promptView lp_explodeWithDuration:1];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        if (self.registerClkBlock) {
            self.registerClkBlock();
        }
        [self.class hide];
    });
  

}


+ (void)hide
{
        [popView removeFromSuperview];
        popView = nil ;
        once_token = 0 ;
}

+ (void)setLoginOperationBlock:(void (^)(void))operationBlock
{
    [[self sharePopView] setLoginClkBlock:operationBlock];
}

+ (void)setRegisterOperationBlock:(void (^)(void))operationBlock
{
    [[self sharePopView] setRegisterClkBlock:operationBlock];
}
- (void)dealloc
{
    HMLog(@"注销");
}
@end
