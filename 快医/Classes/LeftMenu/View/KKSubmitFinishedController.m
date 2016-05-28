//
//  KKSubmitFinishedController.m
//  快医
//
//  Created by 柯平常 on 16/5/12.
//  Copyright © 2016年 bear. All rights reserved.
//

#import "KKSubmitFinishedController.h"

@interface KKSubmitFinishedController ()

@property (weak, nonatomic) IBOutlet UIImageView *smileView;
@property (weak, nonatomic) IBOutlet UIButton *backBtn;
@property (weak, nonatomic) IBOutlet UIButton *personalBtn;


@end

@implementation KKSubmitFinishedController

- (void)viewWillAppear:(BOOL)animated{
    
    
    self.title = @"已提交审核";
}


- (void)viewDidLoad{

    self.smileView.layer.cornerRadius =50;
    self.smileView.clipsToBounds = YES;

}

#pragma mark - 返回首页
- (IBAction)returnHomeView:(UIButton *)sender {
    
    [self.navigationController popToRootViewControllerAnimated:YES];
    
}


#pragma mark - 个人中心
- (IBAction)userCenter:(UIButton *)sender {
    
    [self.navigationController popToRootViewControllerAnimated:YES];

    [[NSNotificationCenter defaultCenter]postNotificationName:@"switchLeftMenu" object:nil];

}



@end
