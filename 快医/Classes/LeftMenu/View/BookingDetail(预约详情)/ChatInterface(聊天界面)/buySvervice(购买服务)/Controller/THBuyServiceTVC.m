//
//  THBuyServiceTVC.m
//  快医
//
//  Created by litianhao on 16/5/13.
//  Copyright © 2016年 bear. All rights reserved.
//

#import "THBuyServiceTVC.h"

#import "THBuySeviceTV.h"

#import <SVProgressHUD.h>
@interface THBuyServiceTVC ()

@property (nonatomic,weak) THBuySeviceTV *buyService;

@end

@implementation THBuyServiceTVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];

    THBuySeviceTV *buyV = [[THBuySeviceTV alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:buyV];
    _buyService = buyV ;
    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(20, self.view.height - 60 - NavigationBar_HEIGHT - 20, self.view.width - 40, 40)];
    [btn setTitle:@"购买服务" forState:UIControlStateNormal];
    btn.backgroundColor = COLOR(35, 189, 184, 1)  ;
    [btn addTarget:self action:@selector(buyBtnClk) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.title = @"购买服务";
    
}
- (void)buyBtnClk
{
    if (self.buyService.hsaSelected) {
        if (self.setCountAndTime) {
            self.setCountAndTime( 5 , 5);
        }
    }

    [self showAlertWithSuccess:self.buyService.hsaSelected];
}

- (void)showAlertWithSuccess:(BOOL)success
{
    NSString *title = success ? @"购买成功" : @"购买失败";
    NSString *message = success ? @"您现在有5次咨询机会" : @"请选择支付途径" ;
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    [self presentViewController:alert animated:YES completion:^{
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [alert dismissViewControllerAnimated:YES completion:nil];
        });
    }];
    
    if(success)
    {
   dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
       [self.navigationController popViewControllerAnimated:YES];
   });
    }
}

@end
