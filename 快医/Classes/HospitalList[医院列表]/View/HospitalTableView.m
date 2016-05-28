//
//  HospitalTableView.m
//  快医
//
//  Created by 付凯琪 on 16/5/9.
//  Copyright © 2016年 bear. All rights reserved.
//

#import "HospitalTableView.h"

#import "HospitalTableViewCell.h"


@interface HospitalTableView ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, strong) NSArray *hospitals;//模型数据
@end
@implementation HospitalTableView

//初始化
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {

      
        //数据源/代理
        self.dataSource = self;
        self.delegate = self;
        
        
        self.separatorStyle = UITableViewCellSeparatorStyleNone;

    }
    return self;
}

#pragma UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return self.hospitals.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    HospitalTableViewCell *cell = [HospitalTableViewCell hospitalCellWithTableView:tableView];

    HospitalData *data = self.hospitals[indexPath.item];
    cell.data = data;
    
    return cell;
    
}

#pragma UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    return 100;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    //MARK: 取消cell的选中变灰色效果
    [self deselectRowAtIndexPath:indexPath animated:YES];
    
        HospitalData *data = self.hospitals[indexPath.item];
    
    if (self.jumpToVc) {
        self.jumpToVc(data,self.hospitals);
        
    }
    
}


#pragma mark - 懒加载

- (NSArray *)hospitals{

    if (!_hospitals) {

        _hospitals = [HospitalData loadHospitalDataWithPlistName:self.plistName];
        
        
    }
    return _hospitals;
}
@end
