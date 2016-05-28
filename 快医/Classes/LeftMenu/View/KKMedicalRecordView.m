//
//  KKMedicalRecordView.m
//  快医
//
//  Created by 柯平常 on 16/5/11.
//  Copyright © 2016年 bear. All rights reserved.
//

#import "KKMedicalRecordView.h"
#import "KKMedicalrecordTableView.h"

@interface KKMedicalRecordView ()


@property (weak, nonatomic) IBOutlet UIButton *addCasehistoryBtn;
@property (weak, nonatomic) IBOutlet UITableView *MedicalCaseHittoryTableView;

@end

@implementation KKMedicalRecordView

- (void)layoutSubviews{

    [super layoutSubviews];
    
    self.addCasehistoryBtn.layer.borderColor = [[UIColor lightGrayColor]CGColor];
    self.addCasehistoryBtn.layer.borderWidth = 1.0;
    self.addCasehistoryBtn.layer.cornerRadius = 5;
    [self.addCasehistoryBtn clipsToBounds];
    
    
    KKMedicalrecordTableView *medicalTABView = [[KKMedicalrecordTableView alloc]initWithFrame:self
                                                .MedicalCaseHittoryTableView.bounds];
    
    [self.MedicalCaseHittoryTableView addSubview:medicalTABView];

}

//UIViewController *vC= [[UIStoryboard storyboardWithName:@"Info" bundle:nil] instantiateInitialViewController];
//[[NSNotificationCenter defaultCenter]postNotificationName:@"pushVc" object:nil userInfo:@{@"vC":vC}];

- (IBAction)changeUserInfoBtnClick:(UIButton *)sender {
    
    UIViewController *vC= [[UIStoryboard storyboardWithName:@"Info" bundle:nil] instantiateInitialViewController];
    [[NSNotificationCenter defaultCenter]postNotificationName:@"pushVc" object:nil userInfo:@{@"vC":vC}];
    
}


- (IBAction)addCasehistoryBtnClick:(UIButton *)sender {

    if (self.returnAddCasehistoryBlock) {
        self.returnAddCasehistoryBlock();
    }
}


@end
