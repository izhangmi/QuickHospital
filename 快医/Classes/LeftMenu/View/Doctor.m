//
//  Doctor.m
//  Doctor
//
//  Created by 张少霞 on 16/5/11.
//  Copyright © 2016年 zsx. All rights reserved.
//

#import "Doctor.h"
#import "DoctorModel.h"
#import "DoctorCell.h"

#define KDoctorCell @"DoctorCell"



@interface Doctor ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic ,strong)NSMutableArray *modelArrM;


@end


@implementation Doctor

//懒加载
-(NSMutableArray *)modelArrM{
    if (!_modelArrM) {
        NSArray *array = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"Doctor.plist" ofType:nil]];
        
        NSMutableArray *Marr = [[NSMutableArray alloc]initWithCapacity:array.count];
        
        [array enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            
            NSDictionary *dict = obj;
            DoctorModel *model = [DoctorModel doctorModelWithDict:dict];
            
            [Marr addObject:model];
            
        }];
        
        _modelArrM = Marr;
        
    }
    return _modelArrM;
 }




-(instancetype)initWithFrame:(CGRect)frame{

    self = [super initWithFrame:frame];

    if (self) {
        //        设置代理
        self.dataSource = self;
        
        self.delegate = self;
        //        弹簧取消
        self.bounces = NO;
        
        self.separatorStyle = UITableViewCellSeparatorStyleNone;
        
        //    设置底部视图
        self.tableFooterView = [[UIView alloc]init];
    
      
    }
  
    return self;
    
}

#pragma mark UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.modelArrM.count;
    
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    DoctorCell *cell = [tableView dequeueReusableCellWithIdentifier:KDoctorCell];
    
    if (!cell) {
        cell = [[DoctorCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:KDoctorCell];
        
    }
    
    
    DoctorModel *model = self.modelArrM[indexPath.row];
    
    cell.model = model;
    
//    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    
    return cell;

    
    
}

#pragma mark UITableViewDelegate
//行高
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 60;
    
}




@end
