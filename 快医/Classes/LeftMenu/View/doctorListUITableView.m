//
//  doctorListUITableView.m
//  Doctor List
//
//  Created by 张少霞 on 16/5/10.
//  Copyright © 2016年 zsx. All rights reserved.
//

#import "doctorListUITableView.h"
#import "doctorListModel.h"
#import "doctorListCell.h"

#import "THBookingDetailVC.h"

#define KdoctorListCell @"doctorListCell"
@interface doctorListUITableView ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic ,strong)NSMutableArray *arrM;


@end

@implementation doctorListUITableView

-(NSMutableArray *)arrM{
    if (!_arrM) {
        NSArray *array = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"seeDoctort.plist" ofType:nil]];
        
        NSMutableArray *Marr = [[NSMutableArray alloc]initWithCapacity:array.count];
        
        [array enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            
            NSDictionary *dict = obj;
            doctorListModel *model = [doctorListModel notificationModelWithDict:dict];
            
            [Marr addObject:model];
            
        }];
        
        _arrM = Marr;
        
    }
    return _arrM;
    
}


-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    
    if (self) {
        //        设置代理
        self.dataSource = self;
        
        self.delegate = self;
        //        弹簧取消
        self.bounces = NO;
        
//       self.separatorStyle = UITableViewCellSeparatorStyleNone;
        
       //    设置底部视图
        
        self.tableFooterView = [[UIView alloc]init];
        
        
    }
    return self;
    
}


#pragma mark UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    NSLog(@"%zd",self.arrM.count);
    
    return self.arrM.count;
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    //自定义cell
    
    doctorListCell *cell = [tableView dequeueReusableCellWithIdentifier:KdoctorListCell];
    
    if (!cell) {
        
        cell = [[doctorListCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:KdoctorListCell];
        
    }
    
    doctorListModel *model = self.arrM[indexPath.row];
    
    cell.model = model;
//    不可点击
    
    
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    
    return cell;
    
}

#pragma mark UITableViewDelegate
//行高
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 80;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    THBookingDetailVC *vc = [[THBookingDetailVC alloc] init];
    vc.modelToDisplay = self.arrM[indexPath.row];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"pushVc" object:nil userInfo:@{@"vC" : vc}];
}


@end
