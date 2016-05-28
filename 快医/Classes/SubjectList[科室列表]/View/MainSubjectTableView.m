//
//  MainSubjectTableView.m
//  快医
//
//  Created by 付凯琪 on 16/5/10.
//  Copyright © 2016年 bear. All rights reserved.
//

#import "MainSubjectTableView.h"
#import "Subject.h"
#import "MainSubjectCell.h"
#define kUITableViewCell @"UITableViewCell"
@interface MainSubjectTableView ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) NSMutableArray *subjects;

@end

@implementation MainSubjectTableView


- (instancetype)initWithFrame:(CGRect)frame{

    if (self = [super initWithFrame:frame]) {
        
        //设置数据源
        self.dataSource = self;
        
        self.showsVerticalScrollIndicator = NO;

        self.delegate = self;
        
        self.separatorStyle = UITableViewCellSeparatorStyleNone;
//        self.bounces = NO;
        self.layer.borderWidth = 1;
        self.layer.borderColor = [UIColor colorWithRed:220/255.0 green:220/255.0 blue:220/255.0 alpha:1].CGColor;

    }
    return self;
}

- (void)setScrollNotity:(NSString *)scrollNotity{

    _scrollNotity = scrollNotity;
    
    //接受选中通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(selectRowWithNotify:) name:scrollNotity object:nil];
    


}
#pragma 接受选中通知的方法

- (void)selectRowWithNotify:(NSNotification *)notify{

    NSIndexPath *index = notify.object;
    
    [self selectRowAtIndexPath:index animated:YES scrollPosition:UITableViewScrollPositionNone];
}


- (void)dealloc{

    [[NSNotificationCenter defaultCenter] removeObserver:self];

}

#pragma UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    //branchSubject加载数据通知
    [[NSNotificationCenter defaultCenter] postNotificationName:self.selectNotity object:indexPath];
    
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 88;

}

#pragma UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.subjects.count;

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    MainSubjectCell *cell = [tableView dequeueReusableCellWithIdentifier:kUITableViewCell];
    
    if (!cell) {
        cell = [[MainSubjectCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kUITableViewCell];
    }
    Subject *subject = self.subjects[indexPath.item];
    cell.textLabel.text = subject.mainSj;
    cell.textLabel.textAlignment = NSTextAlignmentCenter;
    cell.textLabel.textColor = [UIColor colorWithRed:100/255.0 green:100/255.0 blue:100/255.0 alpha:1];
    
    cell.backgroundColor = [UIColor colorWithRed:240/255.0 green:240/255.0 blue:240/255.0 alpha:1];
    cell.selectedBackgroundView = [[UIView alloc] initWithFrame:cell.contentView.bounds];
    cell.selectedBackgroundView.backgroundColor = [UIColor whiteColor];
    
    return cell;
}

#pragma mark - 懒加载

- (NSMutableArray *)subjects{

    if (!_subjects) {

        _subjects = [Subject loadSubjectDataWithPlistName:self.dataName];
        
        //传递数据的通知
        [[NSNotificationCenter defaultCenter] postNotificationName:self.loadDataNotity object:_subjects];
        
#pragma mark - 选中第一行
        NSIndexPath *index = [NSIndexPath indexPathForRow:0 inSection:0];
        [self selectRowAtIndexPath:index animated:NO scrollPosition:UITableViewScrollPositionNone];

    }
    return _subjects;
}


@end
