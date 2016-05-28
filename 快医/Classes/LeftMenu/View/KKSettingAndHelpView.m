//
//  KKSettingAndHelpView.m
//  快医
//
//  Created by 柯平常 on 16/5/10.
//  Copyright © 2016年 bear. All rights reserved.
//

#import "KKSettingAndHelpView.h"
#import "KKLeftMenuTABView.h"
#import "UserService.h"


@implementation KKSettingAndHelpView

- (void)viewWillAppear:(BOOL)animated{
    
    self.title = @"设置与帮助";
    
    self.navigationController.navigationBarHidden=NO;
}


- (void)viewDidLoad{
    
    
    
    KKLeftMenuTABView *ltableView = [[KKLeftMenuTABView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) style:UITableViewStylePlain];
    
    ltableView.settingPlistName = @"settingAndHelp";
    
    ltableView.chectUpdateBlock = ^(UIAlertController *alertVc){
        [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
            [self presentViewController:alertVc animated:YES completion:nil];
            
        });
    };
    
    //MARK: 增加注销button
    UIButton *loginOutBtn = [[UIButton alloc]initWithFrame:CGRectMake(15, SCREEN_HEIGHT - 150, SCREEN_WIDTH - 30, 42)];
    [loginOutBtn setTitle:@"注销" forState:UIControlStateNormal];
    [loginOutBtn setBackgroundImage:[UIImage imageNamed:@"anniu"] forState:UIControlStateNormal];
    loginOutBtn.layer.cornerRadius = 8;
    loginOutBtn.clipsToBounds = YES;
    [loginOutBtn addTarget:self action:@selector(loginOutBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:ltableView];
    [self.view addSubview:loginOutBtn];
    
}

#pragma mark - 注销按钮点击方法
-(void)loginOutBtnClick{
    
    UIAlertController *alertVc = [UIAlertController alertControllerWithTitle:@"提示" message:@"确定要注销吗?" preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *cancle = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    UIAlertAction *sure = [UIAlertAction actionWithTitle:@"退出登录" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {

            [self.navigationController popToRootViewControllerAnimated:YES];
        
    }];



    [alertVc addAction:cancle];
    [alertVc addAction:sure];
    
    [self presentViewController:alertVc animated:YES completion:nil];

    [UserService shareUserService].isLogin=NO;

    [[NSNotificationCenter defaultCenter]postNotificationName:LOGIN_STATUS_CHANGE object:nil];
    NSLog(@"注销登录!");



}





@end
