//
//  HospitalListView.m
//  快医
//
//  Created by 付凯琪 on 16/5/10.
//  Copyright © 2016年 bear. All rights reserved.
//

#import "HospitalListView.h"
#import "HospitalTableView.h"
#import "HospitalHeaderView.h"
#define ktugBtnlist @"tugBtnlist"

@interface HospitalListView ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, weak) HospitalTableView *hospitalTableView;
@property (nonatomic, weak) HospitalHeaderView *headerView;

@property (nonatomic, weak) UITableView *rankView;

//按钮模型
@property (nonatomic, strong) NSMutableArray *listData;
@end
@implementation HospitalListView

- (instancetype)initWithFrame:(CGRect)frame{

    if (self = [super initWithFrame:frame]) {
        
        self.frame = CGRectMake(0, -60, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
        
        
        //HospitalHeaderView
        HospitalHeaderView *headerView = [[HospitalHeaderView alloc] init];
        _headerView = headerView;
        
        
        HospitalTableView *hospitalTableView = [[HospitalTableView alloc] init];
        _hospitalTableView = hospitalTableView;
        
        
        [self addSubview:headerView];
        [self addSubview:hospitalTableView];

        //下拉按钮
        headerView.tugBtnClick = ^(NSArray *listData){
            
            UIButton *maskBtn = [[UIButton alloc] initWithFrame:[UIScreen mainScreen].bounds];
            [maskBtn setBackgroundColor:[UIColor clearColor]];
            [maskBtn addTarget:self action:@selector(maskBtnClick:) forControlEvents:UIControlEventTouchUpInside];
            
            
            [self addSubview:maskBtn];
            
            
            [self.rankView removeFromSuperview];
            self.rankView = nil;
            
            [self.listData removeAllObjects];
            self.listData = nil;
            
            self.listData = [listData mutableCopy];
            
            UITableView *rankView = [[UITableView alloc]initWithFrame:CGRectMake(0, 120, [UIScreen mainScreen].bounds.size.width, (self.height - 120 ) / 2)];
            self.rankView = rankView;
            rankView.dataSource = self;
            rankView.delegate = self;
            
            
            rankView.bounces = NO;
            rankView.rowHeight = 50;
            
            
            //透明背景
            rankView.backgroundView = nil;
            rankView.backgroundView = [[UIView alloc] init];
            rankView.backgroundView.backgroundColor = [UIColor clearColor];
            rankView.backgroundColor = [UIColor clearColor];
            
            
            rankView.showsVerticalScrollIndicator = NO;
            rankView.separatorStyle = UITableViewCellSeparatorStyleNone;
            [self addSubview:rankView];
            [rankView reloadData];

            
        };
        
    }
    return self;
}

- (void)maskBtnClick:(UIButton *)sender{
    [self.rankView removeFromSuperview];
    _rankView = nil;
    [sender removeFromSuperview];
    sender = nil;

}


#pragma UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return self.listData.count;

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ktugBtnlist];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ktugBtnlist];
    }
    
    [[cell.contentView viewWithTag:1000] removeFromSuperview];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.backgroundColor = [UIColor clearColor];
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 50)];
    view.backgroundColor =  [UIColor blackColor];
    view.alpha = 0;
    view.tag = 1000 ;
    [cell.contentView insertSubview:view belowSubview:cell.textLabel];
//    [cell.contentView addSubview:view];
    
    
    [UIView animateWithDuration:0.3 animations:^{
        
        view.transform = CGAffineTransformMakeScale(0.9 , 0.9 );
        view.alpha = 0.8;
    }];
    
    cell.textLabel.text = self.listData[indexPath.item];
    NSLog(@"%@",cell.textLabel.text);
    cell.textLabel.textColor = [UIColor whiteColor];
    cell.textLabel.textAlignment = NSTextAlignmentCenter | NSTextAlignmentCenter;

    return cell;
}


#pragma mark - 模型传递
- (void)setPlistName:(NSString *)plistName{

    _plistName = plistName;
    self.hospitalTableView.plistName = plistName;

}

- (void)setChoiceStr:(NSString *)ChoiceStr{

    _ChoiceStr = ChoiceStr;
    _headerView.ChoiceStr = ChoiceStr;
}

- (void)layoutSubviews{

    [super layoutSubviews];
    _headerView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 120);
    _hospitalTableView.frame = CGRectMake(0, 120, [UIScreen mainScreen].bounds.size.width, self.height - 120);

}

@end
