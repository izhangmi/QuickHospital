//
//  KKPaymentdetailsViewController.m
//  快医
//
//  Created by 柯平常 on 16/5/10.
//  Copyright © 2016年 bear. All rights reserved.
//

#import "KKPaymentdetailsViewController.h"
#import "PayDetailsTableView.h"

@interface KKPaymentdetailsViewController ()

@end

@implementation KKPaymentdetailsViewController

- (void)viewWillAppear:(BOOL)animated{
    
    self.title = @"支付明细";
    

    
    PayDetailsTableView *tableView = [[PayDetailsTableView alloc]initWithFrame:self.view.bounds];
    
    tableView.bounces = NO;
    
    [self.view addSubview:tableView];

    
//    self.navigationController.navigationBarHidden=NO;
}




@end
