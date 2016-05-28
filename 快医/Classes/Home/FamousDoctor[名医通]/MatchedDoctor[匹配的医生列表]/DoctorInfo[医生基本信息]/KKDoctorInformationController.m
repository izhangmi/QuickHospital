//
//  KKDoctorInformationController.m
//  快医
//
//  Created by 柯平常 on 16/5/13.
//  Copyright © 2016年 bear. All rights reserved.
//

#import "KKDoctorInformationController.h"

@interface KKDoctorInformationController ()

@property (weak, nonatomic) IBOutlet UIImageView *userHandImageView;


@end

@implementation KKDoctorInformationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.userHandImageView.layer.cornerRadius = 8;
    self.userHandImageView.clipsToBounds = YES;
    
    
}

- (void)viewWillAppear:(BOOL)animated{

    self.title = @"医生详情";

}

@end
