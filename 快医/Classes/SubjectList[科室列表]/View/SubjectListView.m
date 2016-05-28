//
//  SubjectListView.m
//  快医
//
//  Created by 付凯琪 on 16/5/10.
//  Copyright © 2016年 bear. All rights reserved.
//

#import "SubjectListView.h"
#import "MainSubjectTableView.h"
#import "SubjectHeaderView.h"
#import "BranchSubjectCollectionView.h"

@interface SubjectListView ()
@property (nonatomic, weak) SubjectHeaderView *headerVC;

@property (nonatomic, weak) MainSubjectTableView *mainSubjectView;

@property (nonatomic, weak) BranchSubjectCollectionView *branchSubjectView;

@property (nonatomic, strong) UICollectionViewFlowLayout *flowLayout;

@end
@implementation SubjectListView


- (instancetype)initWithFrame:(CGRect)frame{

    if (self = [super initWithFrame:frame]) {
        
        
        self.frame = CGRectMake(0, - 100, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height + (100 - NavigationBar_HEIGHT - 20));
        

        //SubjectHeaderView
        SubjectHeaderView *headerView = [[SubjectHeaderView alloc] initWithFrame:CGRectMake(0, 0, self.width, 100)];
        _headerVC = headerView;
        
        
        //加载科室列表
        MainSubjectTableView *mainsubjectView = [[MainSubjectTableView alloc] init];
        _mainSubjectView = mainsubjectView;
        
        
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
                _flowLayout = flowLayout;
        BranchSubjectCollectionView *branchSubjectView = [[BranchSubjectCollectionView alloc] initWithFrame:CGRectMake(self.width / 3, 100, self.width - _mainSubjectView.width, self.height - 100) collectionViewLayout:flowLayout];
        _branchSubjectView = branchSubjectView;

        
        flowLayout.itemSize = branchSubjectView.bounds.size;
        flowLayout.minimumLineSpacing = 0;
        flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        
        
        [self addSubview:headerView];
        [self addSubview:mainsubjectView];
        [self addSubview:branchSubjectView];
    }
    
    return self;
}

- (void)setSelectNotity:(NSString *)selectNotity{

    _selectNotity = selectNotity;
    self.mainSubjectView.selectNotity = self.selectNotity;
    self.branchSubjectView.selectNotity = self.selectNotity;
}

- (void)setScrollNotity:(NSString *)scrollNotity{

    _scrollNotity = scrollNotity;
    self.mainSubjectView.scrollNotity = self.scrollNotity;
    self.branchSubjectView.scrollNotity = self.scrollNotity;
}

- (void)setLoadDataNotity:(NSString *)loadDataNotity{

    _loadDataNotity = loadDataNotity;
    self.mainSubjectView.loadDataNotity = self.loadDataNotity;
    self.branchSubjectView.loadDataNotity = self.loadDataNotity;
}

- (void)setDataName:(NSString *)dataName{

    _dataName = dataName;
    self.mainSubjectView.dataName = self.dataName;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    _mainSubjectView.frame = CGRectMake(0, 100, self.width / 3, self.height - 100);
    
    _branchSubjectView.frame = CGRectMake(self.width / 3, 100, self.width - _mainSubjectView.width, self.height - 100);
    _flowLayout.itemSize = _branchSubjectView.bounds.size;
    _flowLayout.minimumLineSpacing = 0;
    _flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    
    _headerVC.frame = CGRectMake(0, 0, self.width, 100);
}

- (void)setData:(HospitalData *)data{

    _data = data;

    _headerVC.data = data;
}

@end
