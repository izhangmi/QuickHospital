//
//  KKUserTreatyController.m
//  快医
//
//  Created by 柯平常 on 16/5/13.
//  Copyright © 2016年 bear. All rights reserved.
//

#import "KKUserTreatyController.h"

@interface KKUserTreatyController ()

@end

@implementation KKUserTreatyController

- (void)viewWillAppear:(BOOL)animated{

    self.title = @"用户协议";

}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"use"]];
    
    
    UILabel *userAgreement = [[UILabel alloc]initWithFrame:CGRectMake(20, 30, self.view.bounds.size.width - 40, 300)];
    
    
    UILabel  *titleLable = [[UILabel alloc]initWithFrame:CGRectMake(self.view.bounds.size.width * 0.5-40, 50, self.view.bounds.size.width - 40, 30)];
    
    
    titleLable.text = @"黑马一哥";
    
    
    titleLable.font = [UIFont systemFontOfSize:24];
    
    userAgreement.font = [UIFont systemFontOfSize:20];
    userAgreement.text = @"   嘿嘿嘿 嘿嘿嘿 给大家来点开心的 我们的用户谢意...写意...谢毅..no no no 这协议咋就这么难写     我们有专业的团队为您开发,不要担心什么bug,什么体验,我们会为您测试,保证您用到的没有什么问题,有问题也情有可原哦,不要太在意吗?也不要太夸我们,不然会骄傲的!嘿嘿嘿";
    
    userAgreement.backgroundColor = THEME_COLOR_GREEN;
    userAgreement.numberOfLines= 0;
    
    userAgreement.layer.cornerRadius = 30;
    
    
    [self.view addSubview:userAgreement];
    [self.view addSubview:titleLable];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
