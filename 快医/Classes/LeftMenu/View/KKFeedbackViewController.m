//
//  KKFeedbackViewController.m
//  快医
//
//  Created by 柯平常 on 16/5/10.
//  Copyright © 2016年 bear. All rights reserved.
//

#import "KKFeedbackViewController.h"


@interface KKFeedbackViewController ()<UITextViewDelegate>

@property (nonatomic, strong) UIView *containerView;
@property (nonatomic, strong) UITextView *textView;
@property (nonatomic, strong) UILabel *textAssistLabel;
@property (nonatomic, strong) UILabel *textRemindLabel;
@property (nonatomic, strong) UILabel *textCount;

@end

@implementation KKFeedbackViewController


- (void)viewWillAppear:(BOOL)animated{
    
    self.title = @"意见反馈";
    
    self.navigationController.navigationBarHidden = NO;
    
    self.view = self.containerView;
}


- (void)leftBarItemClick{
    
    [self dismissViewControllerAnimated:NO completion:nil];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"switchLeftMenu" object:nil];
}

- (void)viewDidLoad{
    
    
}

#pragma mark - 注销按钮点击方法
-(void)loginOutBtnClick{
    
    NSLog(@"提交反馈,反馈内容是:%@",self.textView.text);
    UIAlertController *alertVc = [UIAlertController alertControllerWithTitle:@"提交成功" message:@"谢谢您的反馈!" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *sure = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
    [alertVc addAction:sure];
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
        [self presentViewController:alertVc animated:YES completion:nil];
    });
    
}

- (void)callCustomerService{
    
    UIApplication *app = [UIApplication sharedApplication];
    NSURL *url = [NSURL URLWithString:@"tel://10086"];
    [app openURL:url];
    NSLog(@"tel:10086!");
    
}

#pragma mark - textView的代理方法

- (void) textViewDidChange:(UITextView *)textView{
    if ([textView.text length] == 0) {
        [self.textAssistLabel setHidden:NO];
    }else{
        [self.textAssistLabel setHidden:YES];
    }
    self.textCount.text = [NSString stringWithFormat:@"%zd",200 - textView.text.length];
}

- (void) textViewDidBeginEditing:(UITextView *)textView{
    [self.textAssistLabel setHidden:YES];
}


#pragma mark - 懒加载控件

-(UIView *)containerView{
    if (!_containerView) {
        _containerView = [[UIView alloc]initWithFrame:self.view.bounds];
        _containerView.backgroundColor = [UIColor whiteColor];
        
        
        //MARK: 创建三个label,添加到textView上
        
        self.textAssistLabel = [[UILabel alloc]initWithFrame:CGRectMake(6, 7, SCREEN_WIDTH - 30, 20)];
        self.textAssistLabel.text = @"请填写您遇到的问题";
        self.textAssistLabel.font = [UIFont systemFontOfSize:15];
        self.textAssistLabel.textColor = [UIColor grayColor];
        [self.textAssistLabel sizeToFit];
        
        
        self.textRemindLabel = [[UILabel alloc]initWithFrame:CGRectMake(203, 128, SCREEN_WIDTH - 30, 20)];
        self.textRemindLabel.text = @"您还可以填写        字";
        self.textRemindLabel.font = [UIFont systemFontOfSize:15];
        self.textRemindLabel.textColor = [UIColor grayColor];
        [self.textRemindLabel sizeToFit];
        
        
        self.textCount = [[UILabel alloc]initWithFrame:CGRectMake(295, 128, 10, 20)];
        self.textCount.text = [NSString stringWithFormat:@"%zd",200];
        self.textCount.font = [UIFont systemFontOfSize:16];
        [self.textCount sizeToFit];
        
        //MARK: 添加textView
        self.textView = [[UITextView alloc]initWithFrame:CGRectMake(15, 20, SCREEN_WIDTH - 30, SCREEN_HEIGHT / 2 - 180)];
        self.textView.layer.borderWidth = 0.5;
        self.textView.layer.borderColor = [UIColor grayColor].CGColor;
        self.textView.layer.cornerRadius = 5;
        self.textView.clipsToBounds = YES;
        self.textView.font = [UIFont systemFontOfSize:15];
        self.textView.textColor = [UIColor grayColor];
        self.textView.delegate = self;
        
        [self.textView addSubview:self.textAssistLabel];
        [self.textView addSubview:self.textRemindLabel];
        [self.textView addSubview:self.textCount];
        
        
        
        //MARK: 增加 两个Button
//        UIButton *callBtn = [[UIButton alloc]initWithFrame:CGRectMake(15, 195,SCREEN_WIDTH - 30 , 40)];
        CGFloat callBtnY = CGRectGetMaxY(self.textView.frame) + 20;
        
        UIButton *callBtn = [[UIButton alloc]initWithFrame:CGRectMake(15, callBtnY,SCREEN_WIDTH - 30 , 40 )];
        
        [callBtn setTitle:@"欢迎联系我们:10086" forState:UIControlStateNormal];
        [callBtn setBackgroundImage:[UIImage imageNamed:@"anniu"] forState:UIControlStateNormal];
        
        callBtn.layer.cornerRadius = 5;
        callBtn.clipsToBounds = YES;
        [callBtn addTarget:self action:@selector(callCustomerService) forControlEvents:UIControlEventTouchUpInside];
        
        //MARK: button
        //        UIButton *submitBtn = [[UIButton alloc]initWithFrame:CGRectMake(15, SCREEN_HEIGHT - 400, SCREEN_WIDTH - 30, 40)];
        
        
        CGFloat submitBtnY = CGRectGetMaxY(callBtn.frame) + 20;

        UIButton *submitBtn = [[UIButton alloc]initWithFrame:CGRectMake(15, submitBtnY, SCREEN_WIDTH - 30, 40)];
        
        
        [submitBtn setTitle:@"提交反馈" forState:UIControlStateNormal];
        [submitBtn setBackgroundImage:[UIImage imageNamed:@"anniu"] forState:UIControlStateNormal];
        submitBtn.layer.cornerRadius = 5;
        submitBtn.clipsToBounds = YES;
        [submitBtn addTarget:self action:@selector(loginOutBtnClick) forControlEvents:UIControlEventTouchUpInside];
        
        [_containerView addSubview:callBtn];
        [_containerView addSubview:submitBtn];
        [_containerView addSubview:self.textView];
    }
    return _containerView;
}

@end
