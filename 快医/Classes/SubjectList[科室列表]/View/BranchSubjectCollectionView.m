//
//  BranchSubjectCollectionView.m
//  快医
//
//  Created by 付凯琪 on 16/5/10.
//  Copyright © 2016年 bear. All rights reserved.
//

#import "BranchSubjectCollectionView.h"
#import "BranchSubjectCollectionViewCell.h"
#import "Subject.h"
#define kBranchSubjectCollectionViewCell @"BranchSubjectCollectionViewCell"

@interface BranchSubjectCollectionView ()<UICollectionViewDataSource,UICollectionViewDelegate>
@property (nonatomic, strong) NSMutableArray *subjects;
@end

@implementation BranchSubjectCollectionView

- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout{
    if (self = [super initWithFrame:frame collectionViewLayout:layout]) {
        
        //测试代码
//        self.backgroundColor =  [UIColor colorWithRed:((float)arc4random_uniform(256) / 255.0) green:((float)arc4random_uniform(256) / 255.0) blue:((float)arc4random_uniform(256) / 255.0) alpha:1.0];
        
        
        //设置数据源
        self.dataSource = self;
        self.delegate = self;
        
        self.pagingEnabled = YES;
        self.bounces = NO;
        self.backgroundColor = [UIColor whiteColor];
        self.showsHorizontalScrollIndicator = NO;
        
        
        //注册cell
        [self registerClass:[BranchSubjectCollectionViewCell class] forCellWithReuseIdentifier:kBranchSubjectCollectionViewCell];

        }
    return self;
}

- (void)setLoadDataNotity:(NSString *)loadDataNotity{

    _loadDataNotity = loadDataNotity;
    //接受MainSubject传递数据通知
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(loadDataWithNotify:) name:self.loadDataNotity object:nil];

}

- (void)setSelectNotity:(NSString *)selectNotity{
    
    _selectNotity = selectNotity;
    //接受MainSubject选中行的通知
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(changeCurrentItemWithNotify:) name:self.selectNotity object:nil];

}

#pragma UICollectionViewDelegate
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    
    CGFloat offset = scrollView.contentOffset.x;
    
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:offset/self.width inSection:0];
    [[NSNotificationCenter defaultCenter]postNotificationName:self.scrollNotity object:indexPath];
}


#pragma 通知方法
- (void)loadDataWithNotify:(NSNotification *)notify{

    self.subjects = notify.object;
    
    [self reloadData];

}

- (void)changeCurrentItemWithNotify:(NSNotification *)notify{
    
    NSIndexPath *indexPath = notify.object;
    
    [self scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionLeft animated:YES];

}

-(void)dealloc{

    [[NSNotificationCenter defaultCenter] removeObserver:self];

}


#pragma UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return _subjects.count;

}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    BranchSubjectCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kBranchSubjectCollectionViewCell forIndexPath:indexPath];

    Subject *subject = self.subjects[indexPath.item];
    cell.subject = subject;
    
    
    return cell;
}
@end
