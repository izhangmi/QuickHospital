//
//  CCNavigationController.m
//  hedaAssistant
//
//  Created by bear on 16/3/24.
//  Copyright © 2016年 bear. All rights reserved.
//

#import "CCNavigationController.h"
#import "UIImage+CC.h"


#define  CCTabBarNotifacationIsHiden @"CCTabBarHiden"

@interface CCNavigationController ()<UINavigationControllerDelegate>

@end

@implementation CCNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.navigationBar setTintColor:[UIColor whiteColor]];
    self.navigationBar.shadowImage=[[UIImage alloc]init];
    UIImage *imagebg=[UIImage imageWithColor:THEME_COLOR_GREEN];
    [self.navigationBar setBackgroundImage:imagebg forBarMetrics:UIBarMetricsDefault];

}





- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{


    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
    self.topViewController.navigationItem.backBarButtonItem = backItem;

    [self.navigationItem.backBarButtonItem setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]} forState:UIControlStateNormal];

    self.navigationBar.titleTextAttributes=@{NSForegroundColorAttributeName:[UIColor whiteColor]};

    // 调用系统默认做法,因为只有系统才知道怎么做push
    [super pushViewController:viewController animated:animated];
}



@end
