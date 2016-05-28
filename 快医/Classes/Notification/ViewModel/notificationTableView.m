//
//  notificationTableView.m
//  通知
//
//  Created by 张少霞 on 16/5/9.
//  Copyright © 2016年 zsx. All rights reserved.
//
#define KnotificationTableViewCell @"notificationTableViewCell"
#import "notificationTableView.h"
#import "notificationTableViewCell.h"
#import "notificationModel.h"
@interface notificationTableView ()<UITableViewDataSource,UITableViewDelegate>
//数据源
@property (nonatomic ,strong)NSMutableArray *arrM;


@end

@implementation notificationTableView
-(NSMutableArray *)arrM{
    if (!_arrM) {
        NSArray *array = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"notification.plist" ofType:nil]];
        
        NSMutableArray *Marr = [[NSMutableArray alloc]initWithCapacity:array.count];
        
        [array enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
         
            NSDictionary *dict = obj;
            notificationModel *model = [notificationModel notificationModelWithDict:dict];
            
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

        
        self.separatorStyle = UITableViewCellSeparatorStyleNone;
        

//       设置底部视图
        
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

    notificationTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:KnotificationTableViewCell];
    
    if (!cell) {
        
        cell = [[notificationTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:KnotificationTableViewCell];
        
    }
    
    notificationModel *model = self.arrM[indexPath.row];
    
    cell.model = model;
    
    cell.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"nav"]];
    

    
    
    return cell;
    
}

#pragma mark UITableViewDelegate
//行高
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    return 100;
    
}



@end
