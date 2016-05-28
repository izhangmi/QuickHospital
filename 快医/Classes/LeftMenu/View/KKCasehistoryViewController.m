//
//  KKCasehistoryViewController.m
//  快医
//
//  Created by 柯平常 on 16/5/10.
//  Copyright © 2016年 bear. All rights reserved.
//

#import "KKCasehistoryViewController.h"
#import "KKCasehistoryManagerView.h"
#import "KKAddCasehistoryController.h"
#import <Masonry.h>

//测试数据

#import "KKAddCasehistoryControllerTest.h"


@interface KKCasehistoryViewController ()

@end

@implementation KKCasehistoryViewController

- (void)viewWillAppear:(BOOL)animated{
    
    self.title = @"病历管理";
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBarHidden=NO;
}

- (void)viewDidLoad{
    
    
    
    
    KKCasehistoryManagerView *caseManagerView=  [[NSBundle mainBundle]loadNibNamed:@"KKCasehistoryManagerView" owner:nil options:nil].lastObject;
    
    caseManagerView.jumpToAddCasehistoryViewBlock = ^(){

        KKAddCasehistoryControllerTest *addCHVc = [[KKAddCasehistoryControllerTest alloc]init];
        [self.navigationController pushViewController:addCHVc animated:YES];

        
    
    };
    
    [self.view addSubview:caseManagerView];
    
    [caseManagerView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        //        make.edges.equalTo(self.view);
        make.size.equalTo(self.view);
        make.center.equalTo(self.view);
        
    }];
    
    
    
}




@end
