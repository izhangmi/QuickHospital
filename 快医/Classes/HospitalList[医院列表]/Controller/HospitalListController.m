//
//  HispitalListController.m
//  快医
//
//  Created by 付凯琪 on 16/5/9.
//  Copyright © 2016年 bear. All rights reserved.
//

#import "HospitalListController.h"
#import "HospitalListView.h"
#import "HospitalTableView.h"
#import "SubjectListController.h"
#import "HospitalData.h"

//医院搜索
//#import "KKSearchViewController.h"



@interface HospitalListController ()

@property (nonatomic, strong) NSArray *hospitals;

@property (nonatomic, strong) UIButton *barButton;

@end

@implementation HospitalListController


//- (NSArray *)hospitals{
//    if (!_hospitals) {
//        _hospitals = [NSArray array];
//    }
//    return _hospitals;
//}


#pragma mark -  懒加载button

- (UIButton *)barButton{

    if (!_barButton) {
        _barButton = [[UIButton alloc]init];
        [_barButton setImage:[UIImage imageNamed:@"search"] forState:UIControlStateNormal];
        [_barButton setTitle:@"输入医院名称查找" forState:UIControlStateNormal];
        _barButton.hidden = YES;
        [_barButton sizeToFit];
        _barButton.center = self.navigationController.navigationBar.center;
        
        [_barButton addTarget:self action:@selector(barBtnClick) forControlEvents:UIControlEventTouchUpInside];
        self.navigationItem.titleView = _barButton;
    }
    return _barButton;
}


- (void)viewWillAppear:(BOOL)animated{
    
    self.barButton.hidden = NO;

}


#pragma mark - 实现点击跳转到搜索页面的方法

- (void)barBtnClick{

    KKSearchViewController *searchVc = [[KKSearchViewController alloc]init];
    
//    NSMutableArray *arrM = [NSMutableArray arrayWithCapacity:self.hospitals.count];

    //MARK: 遍历模型数组
//    [self.hospitals enumerateObjectsUsingBlock:^(HospitalData *hospitalData, NSUInteger idx, BOOL * _Nonnull stop) {
//       
//        [arrM addObject:hospitalData.name];
//        
//    }];
    
//    arrM writeToFile: atomically:
    

    searchVc.searchPlistName = @"searchHospitals";
    [self presentViewController:searchVc animated:NO completion:nil];

}



- (void)viewDidLoad {
    [super viewDidLoad];

    HospitalListView *listView = [[HospitalListView alloc] init];
    listView.plistName = @"hospitals.plist";
    
    
    //
    [self.view addSubview:listView];
    
    [listView.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([obj isKindOfClass:[HospitalTableView class]]) {
            HospitalTableView *hospitalVC = (HospitalTableView *)obj;
            hospitalVC.jumpToVc = ^(HospitalData *data,NSArray *hospitals){
                self.hospitals = hospitals;
                SubjectListController *subjectVC = [[SubjectListController alloc] init];
                subjectVC.hospitaldata = data;
                [self.navigationController pushViewController:subjectVC animated:YES];
                
            };
        }
    }];
    
}

@end
