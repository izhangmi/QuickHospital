//
//  KKCasehistoryManagerView.m
//  快医
//
//  Created by 柯平常 on 16/5/11.
//  Copyright © 2016年 bear. All rights reserved.
//

#import "KKCasehistoryManagerView.h"

@interface KKCasehistoryManagerView ()

@property (weak, nonatomic) IBOutlet UIButton *addCasehistoryBtn;

@property (weak, nonatomic) IBOutlet UIImageView *iconImgView;


@end

@implementation KKCasehistoryManagerView


-(void)layoutSubviews{

    [super layoutSubviews];
    
    
    
    self.addCasehistoryBtn.layer.borderColor = [[UIColor lightGrayColor]CGColor];
    self.addCasehistoryBtn.layer.borderWidth = 1.0;
    self.addCasehistoryBtn.layer.cornerRadius = 5;
    [self.addCasehistoryBtn clipsToBounds];
    
    self.iconImgView.layer.cornerRadius = 20;
//    [self.iconImgView clipsToBounds];
    self.iconImgView.clipsToBounds = YES;
    

}


#pragma mark - 修改个人信息 和 添加病历点击方法

- (IBAction)changeUserInfoBtnClick:(UIButton *)sender {
    
    UIViewController *vC= [[UIStoryboard storyboardWithName:@"Info" bundle:nil] instantiateInitialViewController];
    [[NSNotificationCenter defaultCenter]postNotificationName:@"pushVc" object:nil userInfo:@{@"vC":vC}];
    
}


- (IBAction)addCasehistoryBtnClick:(UIButton *)sender {
    
    if (self.jumpToAddCasehistoryViewBlock) {
        self.jumpToAddCasehistoryViewBlock();
    }
    
}

@end
