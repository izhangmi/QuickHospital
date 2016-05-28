//
//  KKRegistrationViewController.m
//  快医
//
//  Created by 柯平常 on 16/5/10.
//  Copyright © 2016年 bear. All rights reserved.
//

#import "KKRegistrationViewController.h"
#import "Doctor.h"
@interface KKRegistrationViewController ()

@end

@implementation KKRegistrationViewController

- (void)viewWillAppear:(BOOL)animated{
    
    self.title = @"预约挂号列表";

    self.navigationController.navigationBarHidden=NO;
    
    self.view.backgroundColor=[UIColor whiteColor];
    
    
    Doctor *tableView = [[Doctor alloc]initWithFrame:self.view.bounds];
    
    [self.view addSubview:tableView];
    
}


@end
