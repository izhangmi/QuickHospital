//
//  SubjectListController.m
//  快医
//
//  Created by 付凯琪 on 16/5/10.
//  Copyright © 2016年 bear. All rights reserved.
//

#import "SubjectListController.h"
#import "SubjectListView.h"
#import "Subject.h"
#import "SubjectChoiceController.h"

@interface SubjectListController ()
@property (nonatomic, weak) SubjectListView *listView;
//模型数组
@property (nonatomic, strong) NSMutableArray *subjects;

@property (nonatomic, strong) UIButton *barButton;
@end

@implementation SubjectListController

//#pragma mark - 懒加载
-(NSMutableArray *)subjects{
    if (!_subjects) {
        _subjects = [Subject loadSubjectDataWithPlistName:@"Subject.plist"];
    }
    return _subjects;
}


- (UIButton *)barButton{
    
    if (!_barButton) {
        _barButton = [[UIButton alloc]init];
        [_barButton setImage:[UIImage imageNamed:@"search"] forState:UIControlStateNormal];
        [_barButton setTitle:@"输入科室查找" forState:UIControlStateNormal];
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
   
    searchVc.keyWordBlock = ^(NSString *keyBlock){
    
        //MARK: 遍历字典
        [self.subjects enumerateObjectsUsingBlock:^(Subject *subject, NSUInteger idx, BOOL * _Nonnull stop) {
          
            if ([keyBlock isEqualToString:subject.mainSj]) {
                
                NSIndexPath *indexPath = [NSIndexPath indexPathForRow:idx inSection:0];
                [[NSNotificationCenter defaultCenter]postNotificationName:@"SelectRowOfBranchSubjectCollectionView" object:indexPath];
            }
            
        }];
    
    };
    
    searchVc.searchPlistName = @"searchSectionOffice";
    [self presentViewController:searchVc animated:NO completion:nil];
    
}



- (void)viewDidLoad {
    [super viewDidLoad];

    SubjectListView *subjectListView = [[SubjectListView alloc] init];
    _listView = subjectListView;

    subjectListView.selectNotity = @"mainSubjectTableViewSelectRowWithIndex";
    subjectListView.scrollNotity = @"SelectRowOfBranchSubjectCollectionView";
    subjectListView.loadDataNotity = @"mainSubjectTableViewLoadDataSuccess";
    subjectListView.dataName = @"Subject.plist";
    
    if (_hospitaldata) {
        
        _listView.data = _hospitaldata;
    }

    
    [self.view addSubview:subjectListView];
    //接收加载到疾病选择的通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(jumpToSubjectChoiseWithNotify:) name:@"jumpToSubjectChoiseWithNotify" object:NULL];
    
}

#pragma mark - push到疾病选择的方法

- (void)jumpToSubjectChoiseWithNotify:(NSNotification *)notify{
    
    
    SubjectChoiceController *subjectChoiseVc = [[SubjectChoiceController alloc] init];
    subjectChoiseVc.ChoiceStr = notify.object;
    
    [self.navigationController pushViewController:subjectChoiseVc animated:YES];
    
}
- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    if (self.hospitaldata) {

        [UIView animateWithDuration:0.3 animations:^{
            
            self.listView.y = 0;
            
        } completion:^(BOOL finished) {
            
            self.listView.height = self.listView.height - 100;
            
        }];
    }

}

- (void)dealloc{

    [[NSNotificationCenter defaultCenter]removeObserver:self];
}
@end
