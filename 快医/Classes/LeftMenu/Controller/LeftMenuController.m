//
//  LeftMenuController.m
//  快医
//
//  Created by bear on 16/5/9.
//  Copyright © 2016年 bear. All rights reserved.
//


#import "LeftMenuController.h"
#import "KKLeftMenuTABView.h"
#import "TableHeaderView.h"
#import "TableHeaderViewUnlogin.h"
#import "KKSettingAndHelpView.h"
#import "UIColor+CC.h"
#import "UserService.h"


@interface LeftMenuController ()

@property (nonatomic, assign ,getter=isLoginIn) BOOL loginState;


@property (nonatomic, weak) KKLeftMenuTABView *leftMenuView;


@end


@implementation LeftMenuController


-(void)viewDidLoad{


    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(doChangeMenu) name:LOGIN_STATUS_CHANGE object:nil];
    [self doChangeMenu];
}



-(void)doChangeMenu{


    KKLeftMenuTABView *leftMenuView = [[KKLeftMenuTABView alloc]initWithFrame:CGRectMake(0, 20, SCREEN_WIDTH * 0.5 + 100, SCREEN_HEIGHT) style:UITableViewStylePlain];

    self.leftMenuView=leftMenuView;

    UserService *userService=[UserService shareUserService];

    if (userService.isLogin) {
        
        _leftMenuView.settingPlistName = @"LoginSetting";
        _leftMenuView.tableHeaderView = [TableHeaderView headerView];
        

    }else{

        _leftMenuView.settingPlistName = @"UnLoginSetting";
        _leftMenuView.tableHeaderView = [TableHeaderViewUnlogin headerView];
    }

    [self.view.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];

        [self.view addSubview:leftMenuView];


}





@end