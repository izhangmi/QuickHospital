//
//  KKSubmitInformationController.m
//  快医
//
//  Created by 柯平常 on 16/5/12.
//  Copyright © 2016年 bear. All rights reserved.
//

#import "KKSubmitInformationController.h"
#import "KKSubmitFinishedController.h"
#import "userCasehistoryInfo.h"
#import <Masonry.h>

@interface KKSubmitInformationController ()

@end

@implementation KKSubmitInformationController

- (void)viewWillAppear:(BOOL)animated{
    
    
    self.title = @"递交资料";
    
    UIBarButtonItem *rightBarItem= [[UIBarButtonItem alloc]initWithTitle:@"确定" style:UIBarButtonItemStyleDone target:self action:@selector(rightBarItemClick)];
    
    self.navigationItem.rightBarButtonItem = rightBarItem;
    
    
    
}



- (void)viewDidLoad{

    userCasehistoryInfo *userCaseView = [[NSBundle mainBundle]loadNibNamed:@"userCasehistoryInfo" owner:nil options:nil].lastObject;
    
    [self.view addSubview:userCaseView];
    
    
    [userCaseView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        //        make.edges.equalTo(self.view);
        make.size.equalTo(self.view);
        make.center.equalTo(self.view);
        
    }];
    
}


- (void)rightBarItemClick{
    
    KKSubmitFinishedController *subFinishVc= [UIStoryboard storyboardWithName:@"KKSubmitFinish" bundle:nil].instantiateInitialViewController;
    [self.navigationController pushViewController:subFinishVc animated:YES];
    
}



@end
