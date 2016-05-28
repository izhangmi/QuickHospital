//
//  BranchSubjectTableView.m
//  快医
//
//  Created by 付凯琪 on 16/5/10.
//  Copyright © 2016年 bear. All rights reserved.
//

#import "BranchSubjectTableView.h"
#import "BranchSubjectTableViewCell.h"
#define kBranchSubjectTableViewCell @"BranchSubjectTableViewCell"

@interface BranchSubjectTableView ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) NSMutableArray *branchs;
@end
@implementation BranchSubjectTableView

- (instancetype)initWithFrame:(CGRect)frame{

    if (self = [super initWithFrame:frame]) {
    
        //设置代理 / 数据源
        self.dataSource = self;
        self.delegate = self;
        
        
        self.showsVerticalScrollIndicator = NO;
        self.separatorStyle = UITableViewCellSeparatorStyleNone;
        
    }
    return self;
}

#pragma UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    NSString *choice = self.branchs[indexPath.item];
    //跳转到疾病选择的通知
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"jumpToDiseaseChoiseWithNotify" object:choice];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"jumpToSubjectChoiseWithNotify" object:choice];

}


#pragma UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return _branchs.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    BranchSubjectTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kBranchSubjectTableViewCell];
    if (!cell) {
        cell = [[BranchSubjectTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kBranchSubjectTableViewCell];
    }

    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.textLabel.text = self.branchs[indexPath.item];
    cell.textLabel.textAlignment = NSTextAlignmentCenter;
    cell.textLabel.textColor = [UIColor colorWithRed:150/255.0 green:150/255.0 blue:150/255.0 alpha:1];
    
    return cell;
}


- (void)setSubject:(Subject *)subject{

    _subject = subject;
    
    [self.branchs removeAllObjects];
    
    self.branchs = [subject.branchSj mutableCopy];
    [self reloadData];

}

#pragma mark - 懒加载

@end
