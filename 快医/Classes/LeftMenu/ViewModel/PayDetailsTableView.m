//
//  PayDetailsTableView.m
//  支付明细
//
//  Created by 朱宁MacPro on 16/5/10.
//  Copyright © 2016年 朱宁MacPro. All rights reserved.
//

#import "PayDetailsTableView.h"
#import "PayDetailsModel.h"
#import "PayDetailsTableViewCell.h"

#define Kcell  @"cell"

@interface PayDetailsTableView ()<UITableViewDelegate,UITableViewDataSource>


@property(nonatomic,strong)NSMutableArray *modelArrM;


@end
@implementation PayDetailsTableView
//懒加载
-(NSMutableArray *)modelArrM{
    
    if (!_modelArrM) {
        
        NSArray *arr = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"Search.plist" ofType:nil]];
        
        NSMutableArray *arrM = [[NSMutableArray alloc]initWithCapacity:arr.count];
        
        [arr enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            
            NSDictionary *dict = obj;
            
            PayDetailsModel *model = [ PayDetailsModel  PayDetailsModelWithDict:dict];
            
            [arrM addObject:model];
            
            
        }];
        _modelArrM = arrM;
        
    }
    
    return _modelArrM;
    
}
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    
    if (self) {
        
        
        //self.backgroundColor = [UIColor yellowColor];
        
        self.dataSource = self;
        
        self.delegate = self;
        
        self.tableFooterView = [[UIView alloc]init];
        
        
    }
    
    
    return self;
}



#pragma  mark UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    
    return self.modelArrM.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    PayDetailsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:Kcell];
    
    if (!cell) {
        cell = [[PayDetailsTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:Kcell];
        
    }
    
    PayDetailsModel *model = self.modelArrM[indexPath.row];
    
    cell.model = model;
    
    
    
    return cell;
    
    
}



#pragma mark UITableViewDelegate
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    
    
    return  75;
    
}





@end
