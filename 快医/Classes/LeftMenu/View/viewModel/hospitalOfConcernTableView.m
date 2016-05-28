//
//  hospitalOfConcernTableView.m
//  我的收藏
//
//  Created by 朱宁MacPro on 16/5/10.
//  Copyright © 2016年 朱宁MacPro. All rights reserved.
//

#import "hospitalOfConcernTableView.h"
#import "hospitalOfConcernTableViewCell.h"
#import "hospitalOfConcernModel.h"

@interface hospitalOfConcernTableView ()<UITableViewDataSource,UITableViewDelegate>



@property(nonatomic,strong)NSMutableArray *hospiitalArrM;
@end



@implementation hospitalOfConcernTableView
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    
    if (self) {
        
        self.dataSource = self;
        
        self.delegate = self;
        
        self.tableFooterView = [[UIView alloc]init];
        
        
    }
    
    
    return self;
}


-(NSMutableArray *)hospiitalArrM

 {
         if (_hospiitalArrM==nil) {
                 NSString *fullpath=[[NSBundle mainBundle]pathForResource:@"hospital.plist" ofType:nil];
                 NSArray *temparray=[NSArray arrayWithContentsOfFile:fullpath];
        
                 NSMutableArray *arrayM=[NSMutableArray arrayWithCapacity:temparray.count];
                 for (NSDictionary *dict in temparray) {
                     hospitalOfConcernModel *tg=[hospitalOfConcernModel hoispatalModelWithDict:dict];
                         [arrayM addObject:tg];
                     }
                _hospiitalArrM=[arrayM mutableCopy];
             }
     
     NSLog(@"%zd",_hospiitalArrM.count);
       return _hospiitalArrM;
 }

#pragma mark- xib创建cell数据处理

// #pragma mark 多少组
// -(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
//{
//        return 1;
//}

#pragma mark多少行
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.hospiitalArrM.count;
}

#pragma mark设置每组每行
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //1.创建cell
    hospitalOfConcernTableViewCell *cell=[hospitalOfConcernTableViewCell hoispitalCellWithTableView:tableView];
    
    //2.获取当前行的模型,设置cell的数据
    hospitalOfConcernModel *tg=self.hospiitalArrM[indexPath.row];
    cell.hospitalModel=tg;
    
    //3.返回cell
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    return 80;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [self deselectRowAtIndexPath:indexPath animated:YES];
    
    if (self.jumpToTChatVc) {
        self.jumpToTChatVc();
    }
    
}


@end
