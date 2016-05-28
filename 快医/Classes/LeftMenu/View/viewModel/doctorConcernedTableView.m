//
//  doctorConcernedTableView.m
//  收藏03
//
//  Created by 朱宁MacPro on 16/5/12.
//  Copyright © 2016年 朱宁MacPro. All rights reserved.
//

#import "doctorConcernedTableView.h"
#import "doctorConcernedTableViewCell.h"
#import "concernedDoctorModel.h"
#import "CCHttpTool.h"

@interface doctorConcernedTableView ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)NSMutableArray *doctorArrM;

@end

@implementation doctorConcernedTableView
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    
    if (self) {
        
        
        //        self.backgroundColor = [UIColor yellowColor];
        
        self.dataSource = self;
        
        self.delegate = self;
        
        self.tableFooterView = [[UIView alloc]init];
        
        
    }
    
    
    return self;
}



-(NSMutableArray *)doctorArrM
{
    if (_doctorArrM==nil) {

     
        NSDictionary *dict = @{@"user_id":@1000089,@"page_size":@15,@"page":@1};
        
        [CCHttpTool POST:@"http://iosapi.itcast.cn/doctor/doctorList.json.php" parameters:dict success:^(id responseObject) {
            
            NSArray *dataArr = responseObject[@"data"];
            
//            NSLog(@"%@",dataArr);
            NSMutableArray *arrayM=[NSMutableArray arrayWithCapacity:dataArr.count];
            
            [dataArr enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                

                concernedDoctorModel *tg=[concernedDoctorModel doctorModelWithDict:obj];

                [arrayM addObject:tg];
                
            }];
            
            
            _doctorArrM=[arrayM mutableCopy];
                        
            dispatch_async(dispatch_get_main_queue(), ^{
                
                [self reloadData];
            });
            
            
        } failure:^(NSError *error) {
            NSLog(@"error:%@",error);
        }];
        
        

//        NSString *fullpath=[[NSBundle mainBundle]pathForResource:@"PropertyList.plist" ofType:nil];
//        NSArray *temparray=[NSArray arrayWithContentsOfFile:fullpath];
//        
//        
//        NSMutableArray *arrayM=[[NSMutableArray alloc ]initWithCapacity:temparray.count];
//        
//        for (NSDictionary *dict in temparray) {
//            concernedDoctorModel *tg=[concernedDoctorModel doctorModelWithDict:dict];
//            [arrayM addObject:tg];
//        }
//        _doctorArrM=[arrayM mutableCopy];
    }
    //    NSLog(@"%@",_doctorArrM);
    return _doctorArrM;
}
#pragma mark- xib创建cell数据处理



#pragma mark多少行
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.doctorArrM.count;
}

#pragma mark设置每组每行
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //1.创建cell
    doctorConcernedTableViewCell *cell=[doctorConcernedTableViewCell doctorCellWithTableView:tableView];
    
    //2.获取当前行的模型,设置cell的数据
    concernedDoctorModel *tg=self.doctorArrM[indexPath.row];
    cell.doctorConcernedlModel=tg;
    
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
