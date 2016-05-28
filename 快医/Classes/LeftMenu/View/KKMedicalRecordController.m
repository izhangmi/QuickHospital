//
//  KKMedicalRecordController.m
//  快医
//
//  Created by 柯平常 on 16/5/11.
//  Copyright © 2016年 bear. All rights reserved.
//

#import "KKMedicalRecordController.h"
#import "KKMedicalRecordView.h"
#import <Masonry.h>
#import "KKSubmitInformationController.h"
#import "KKAddCasehistoryControllerTest.h"

@interface KKMedicalRecordController ()

@end

@implementation KKMedicalRecordController

- (void)viewWillAppear:(BOOL)animated{
    
    
    self.title = @"病历夹";
    
//    UIBarButtonItem *rightBarItem= [[UIBarButtonItem alloc]initWithTitle:@"确定" style:UIBarButtonItemStyleDone target:self action:@selector(rightBarItemClick)];
//    
//    self.navigationItem.rightBarButtonItem = rightBarItem;
    
    self.navigationController.navigationBarHidden=NO;
    
}


- (void)rightBarItemClick{
    

    KKSubmitInformationController *subInfoVc = [[KKSubmitInformationController alloc]init];
    [self.navigationController pushViewController:subInfoVc animated:YES];

}


- (void)viewDidLoad{
    
    KKMedicalRecordView *medicalView = [[NSBundle mainBundle]loadNibNamed:@"KKMedicalRecordView" owner:nil options:nil].lastObject;
    
    medicalView.returnAddCasehistoryBlock = ^(){
    
//        KKAddCasehistoryControllerTest *addCasehistoryVc = [[KKAddCasehistoryControllerTest alloc]init];
//        [self.navigationController pushViewController:addCasehistoryVc animated:YES];

        KKSubmitInformationController *subInfoVc = [[KKSubmitInformationController alloc]init];
        [self.navigationController pushViewController:subInfoVc animated:YES];
        
    };
    
    
    [self.view addSubview:medicalView];
    
    
    [medicalView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.edges.equalTo(self.view);
        
    }];
    
}



@end
