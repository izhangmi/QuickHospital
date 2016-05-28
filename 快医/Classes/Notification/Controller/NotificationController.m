//
//  ViewController.m
//  通知
//
//  Created by 张少霞 on 16/5/9.
//  Copyright © 2016年 zsx. All rights reserved.
//
//添加UITableView  在 ViewController 上

#import "NotificationController.h"
#import "notificationTableView.h"
@interface NotificationController ()

@end

@implementation NotificationController

- (void)viewDidLoad {
    [super viewDidLoad];


    self.title=@"通知消息";


    self.view.backgroundColor=[UIColor whiteColor];

    notificationTableView *notificationView =[[notificationTableView alloc]initWithFrame:self.view.bounds];


    [self.view addSubview:notificationView];

    
}


@end
