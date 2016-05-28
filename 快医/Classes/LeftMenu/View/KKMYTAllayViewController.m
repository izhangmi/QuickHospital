//
//  KKMYTAllayViewController.m
//  快医
//
//  Created by 柯平常 on 16/5/10.
//  Copyright © 2016年 bear. All rights reserved.
//

#import "KKMYTAllayViewController.h"
#import "doctorListUITableView.h"


@interface KKMYTAllayViewController ()

@end

@implementation KKMYTAllayViewController

- (void)viewWillAppear:(BOOL)animated{
    
    self.title = @"名医通申请";

    self.navigationController.navigationBarHidden=NO;
    
    self.view.backgroundColor=[UIColor whiteColor];
    
    
    doctorListUITableView *tableView = [[doctorListUITableView alloc]initWithFrame:self.view.bounds];
    
    [self.view addSubview:tableView];
    

}




@end
