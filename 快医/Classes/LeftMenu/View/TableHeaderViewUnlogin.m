//
//  TableHeaderViewUnlogin.m
//  快医
//
//  Created by 柯平常 on 16/5/9.
//  Copyright © 2016年 bear. All rights reserved.
//

#import "TableHeaderViewUnlogin.h"

#import <RESideMenu.h>
#import "THLoginVC.h"
#import "THRegisterVC.h"

@interface TableHeaderViewUnlogin ()

@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;

@property (weak, nonatomic) IBOutlet UIButton *loginButton;

@property (weak, nonatomic) IBOutlet UIButton *registerButton;


@end


@implementation TableHeaderViewUnlogin

+(instancetype)headerView{

    TableHeaderViewUnlogin *unloginHeaderView = [[[NSBundle mainBundle]loadNibNamed:@"TableHeaderViewUnlogin" owner:nil options:nil]lastObject];
    unloginHeaderView.iconImageView.layer.cornerRadius = unloginHeaderView.iconImageView.width / 2;
    unloginHeaderView.iconImageView.clipsToBounds = YES;
    
    unloginHeaderView.loginButton.layer.cornerRadius = 5;
    unloginHeaderView.loginButton.clipsToBounds = YES;
    
    unloginHeaderView.registerButton.layer.cornerRadius = 5;
    unloginHeaderView.registerButton.clipsToBounds = YES;
    
    return unloginHeaderView;
}

- (IBAction)loginButtonClk:(id)sender
{
    //回到中间控制器
    RESideMenu *rootVC =  (RESideMenu *)self.window.rootViewController ;
    [rootVC hideMenuViewController];
    //push登录界面
    UINavigationController *navi = (UINavigationController *) rootVC.contentViewController;
        [navi pushViewController:[THLoginVC new] animated:YES];
   
}

- (IBAction)registerButtonClk:(id)sender
{
    //回到中间控制器
    RESideMenu *rootVC =  (RESideMenu *)self.window.rootViewController ;
    [rootVC hideMenuViewController];
    
    //push注册界面
    UINavigationController *navi = (UINavigationController *) rootVC.contentViewController;
        [navi pushViewController:[THRegisterVC new] animated:YES];

}

@end
