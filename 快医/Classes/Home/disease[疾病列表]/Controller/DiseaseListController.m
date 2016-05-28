//
//  DiseaseListController.m
//  快医
//
//  Created by 付凯琪 on 16/5/12.
//  Copyright © 2016年 bear. All rights reserved.
//

#import "DiseaseListController.h"
#import "SubjectListView.h"
#import "BranchSubjectTableView.h"
#import "DiseaseChioseController.h"

@interface DiseaseListController ()

@property (nonatomic, strong) UIButton *barButton;

@end

@implementation DiseaseListController

- (UIButton *)barButton{
    
    if (!_barButton) {
        _barButton = [[UIButton alloc]init];
        [_barButton setImage:[UIImage imageNamed:@"search"] forState:UIControlStateNormal];
        [_barButton setTitle:@"输入疾病类型查找" forState:UIControlStateNormal];
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
    
    searchVc.searchPlistName = @"searchDisease";
    [self presentViewController:searchVc animated:NO completion:nil];
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    SubjectListView *diseaseListView = [[SubjectListView alloc] init];
    
    diseaseListView.selectNotity = @"firstViewDidSelected";
    diseaseListView.scrollNotity = @"firstViewDidScroll";
    diseaseListView.loadDataNotity = @"firstViewPassToSecondView";
    diseaseListView.dataName = @"Disease.plist";
    
    [self.view addSubview:diseaseListView];

    
    //接收加载到疾病选择的通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(jumpToDiseaseChoiseWithNotify:) name:@"jumpToDiseaseChoiseWithNotify" object:NULL];

}

#pragma mark - push到疾病选择的方法

- (void)jumpToDiseaseChoiseWithNotify:(NSNotification *)notify{

    
    DiseaseChioseController *diseaseChoiseVc = [[DiseaseChioseController alloc] init];
    diseaseChoiseVc.ChoiceStr = notify.object;
    
    [self.navigationController pushViewController:diseaseChoiseVc animated:YES];

}

- (void)dealloc{

    [[NSNotificationCenter defaultCenter] removeObserver:self];

}
@end
