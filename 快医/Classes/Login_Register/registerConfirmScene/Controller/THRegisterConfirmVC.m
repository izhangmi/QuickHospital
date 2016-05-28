//
//  THRegisterConfirmVC.m
//  快医
//
//  Created by litianhao on 16/5/10.
//  Copyright © 2016年 bear. All rights reserved.
//

#import "THRegisterConfirmVC.h"
#import <TPKeyboardAvoidingScrollView.h>
#import "THExtensionForLoginSence.h"
#import <RESideMenu.h>

@implementation THRegisterConfirmVC


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
//    //    self.navigationController.navigationBar.tintColor = [UIColor blueColor];
//    self.navigationController.navigationBar.titleTextAttributes = @{
//                                                                    NSForegroundColorAttributeName : [UIColor colorWithWhite:0.3 alpha:1] ,
//                                                                    NSFontAttributeName : [UIFont fontWithName:@"Helvetica-Bold" size:20]
//                                                                    };
//    NSMutableAttributedString *title = [[NSMutableAttributedString alloc] initWithString:@"2/2"];
//    [title setAttributes:@{NSForegroundColorAttributeName : [UIColor blueColor]} range:NSMakeRange(0, 1)];
//    [title setAttributes:@{NSForegroundColorAttributeName : [UIColor colorWithWhite:0.3 alpha:1]} range:NSMakeRange(1, 2)];
//    
//    UILabel *rightLbl = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
//    rightLbl.attributedText = title ;
//    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rightLbl];
//    
//    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"u12"] style:UIBarButtonItemStylePlain target:self action:@selector(leftBarButtonItemClk)];
//    self.navigationItem.leftBarButtonItem.imageInsets = UIEdgeInsetsMake(8, 0, 8, 16);
}



- (void)leftBarButtonItemClk
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)settingWidgetsInEveryRow
{
    CGFloat const verMargin = 40 ;
    CGFloat const horMargin = 10 ;
    CGFloat const rowHeight = 20 ;
    
   UILabel *lbl = [UILabel th_LabelWithTitle:@"请您确认注册信息" frame:CGRectMake( 60,
                                                                horMargin ,
                                                                SCREEN_WIDTH - 2*60,
                                                                38) displayOnView:self.view];
    lbl.font = [UIFont systemFontOfSize:18];

    //测试数据
    NSArray *descLblArr = @[
                                   @{@"真实姓名:" : @"王大锤先生"},
                                   @{@"证件类型:" : @"身份证"},
                                   @{@"证件号码:"  : @"360302198007190539"},
                                   @{@"手机号码:"  : @"18888888888"},
                                   @{@"现居地址:" : @"北京市"}
                                   ];
    
    
    [descLblArr enumerateObjectsUsingBlock:^(NSDictionary * _Nonnull dict, NSUInteger idx, BOOL * _Nonnull stop) {
        NSString *key =   dict.allKeys.lastObject;
        CGFloat textFieldWidth = SCREEN_WIDTH - 2*verMargin ;
        CGFloat textFieldY = 20 + lbl.myHeight + (horMargin + rowHeight)*idx ;
        
        [UILabel th_LabelWithLeftTitle:key rightTitle:dict[key] frame:CGRectMake(
                                                                                 verMargin ,
                                                                                 textFieldY,
                                                                                 textFieldWidth,
                                                                                 rowHeight
                                                                                 )
                         displayOnView:self.view];
        
    }];
    
    
//    UIButton *identifyBtn = [UIButton th_ButtonWithTitle:@"完成注册" frame:;
    UIButton   *identifyBtn   =[UIButton buttonWithType:UIButtonTypeCustom];
    identifyBtn.frame =CGRectMake( verMargin,
                                  20 + (horMargin + rowHeight)*(descLblArr.count + 1) + lbl.myHeight,
                                  SCREEN_WIDTH - 2*verMargin,
                                  rowHeight+10);

    identifyBtn.backgroundColor=[UIColor lightGrayColor];


    [identifyBtn setTitle:@"完成注册" forState:UIControlStateNormal];


    [identifyBtn addTarget:self action:@selector(identifyBtnBlk) forControlEvents:UIControlEventTouchUpInside];
    identifyBtn.titleLabel.font = [UIFont systemFontOfSize:18];
    
    [identifyBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//    identifyBtn.layer.borderWidth = 0 ;
    [self.view addSubview:identifyBtn];
    
}

- (void)identifyBtnBlk
{
    HMLog(@"此处添加 完成注册的业务逻辑");

   [self.navigationController popToRootViewControllerAnimated:NO];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"switchLeftMenu" object:nil];
}

@end
