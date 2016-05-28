//
//  SortsView.m
//  快医
//
//  Created by bear on 16/5/9.
//  Copyright © 2016年 bear. All rights reserved.
//

#import "SortsView.h"
#import "SortButton.h"

#import "THPopView.h"
#import "THLoginVC.h"
#import "THRegisterVC.h"
#import "UserService.h"
#import "KKSetUserInfoViewController.h"
#import "DiseaseViewController.h"

@implementation SortsView


-(instancetype)initWithFrame:(CGRect)frame{


    if (self=[super initWithFrame:frame]) {

        UIView *line0=[[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 1)];
        line0.backgroundColor=COLOR(237, 237, 237, 1);
        [self addSubview:line0];

        UIView * greenSilde=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 6, 27)];
        greenSilde.backgroundColor=COLOR(30, 208, 199, 1);
        [self addSubview:greenSilde];

        UILabel *titleLabel=[[UILabel alloc]initWithFrame:CGRectMake(12, 0, SCREEN_WIDTH-6, 27)];
        titleLabel.text=@"名医通";
        [self addSubview:titleLabel];


        UIView *line=[[UIView alloc]initWithFrame:CGRectMake(0, 27, SCREEN_WIDTH, 1)];
        line.backgroundColor=COLOR(237, 237, 237, 1);
        [self addSubview:line];


        CGFloat width  = 139;
        CGFloat height =41;





        CGFloat margin= (SCREEN_WIDTH-314)*0.5;


        int row,col;


        NSArray *diseases = @[@"肿瘤", @"血液病", @"心血管系统", @"神经系统", @"骨科病",@"更多"];
        for (int i  = 0; i<6; i++) {

            row=i/2;
            col=i%2;

            SortButton *sortButton =[[SortButton alloc]initWithFrame:CGRectMake(margin+(36+width)*col,  41+(height+13)*row, width, height)];
//            sortButton.backgroundColor=[UIColor lightGrayColor];
            [sortButton setImage:[UIImage imageNamed:diseases[i]] forState:UIControlStateNormal];

            [sortButton setTitle:diseases[i] forState:UIControlStateNormal];

            sortButton.tag=i+1;

            [self addSubview:sortButton];

            [sortButton addTarget:self action:@selector(sortBtnClk:) forControlEvents:UIControlEventTouchUpInside];



        }


        
        
    }
    
    
    return self;
}

- (void)sortBtnClk:(UIButton *)sender
{

    UserService *userService=[UserService shareUserService];
    if (!userService.isLogin) {

        if (self.getNavigationControllerBlock) {
            UINavigationController *navi = self.getNavigationControllerBlock();

            [THPopView setLoginOperationBlock:^{
                [navi pushViewController:[THLoginVC new] animated:YES];
            }];
            [THPopView setRegisterOperationBlock:^{
                [navi pushViewController:[THRegisterVC new] animated:YES];
            }];
            [THPopView popOut];
        }


    }else{


      DiseaseViewController  *diseaseVc =   [DiseaseViewController diseaseViewController];
        diseaseVc.ci1_id= @(sender.tag);

        self.jump2VC(diseaseVc);
    }



}

@end
