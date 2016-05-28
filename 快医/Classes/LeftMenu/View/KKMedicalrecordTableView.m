//
//  KKMedicalrecordTableView.m
//  快医
//
//  Created by 朱宁MacPro on 16/5/13.
//  Copyright © 2016年 bear. All rights reserved.
//

#import "KKMedicalrecordTableView.h"
#import "KKmediaclModel.h"
#import "KKMedicalRecordTableViewCell.h"
#define Kcell  @"cell"
@interface KKMedicalrecordTableView ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)NSMutableArray *modelArrM;
@property (nonatomic,strong) KKmediaclModel *preSelectedModel;

@end

@implementation KKMedicalrecordTableView
//懒加载
-(NSMutableArray *)modelArrM{
    
    if (!_modelArrM) {
        
        NSArray *arr = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"KKMedacalRecord.plist" ofType:nil]];
        
        NSMutableArray *arrM = [[NSMutableArray alloc]initWithCapacity:arr.count];
        
        [arr enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            
            NSDictionary *dict = obj;
            
            KKmediaclModel *model = [ KKmediaclModel  KKmedicalModelWithDict:dict];
            
            [arrM addObject:model];
            
            
        }];
        _modelArrM = arrM;
        
    }
    
    return _modelArrM;
    
}
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



#pragma  mark UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    
    return self.modelArrM.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    KKMedicalRecordTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:Kcell];
    
    if (!cell) {
        cell = [[NSBundle mainBundle]loadNibNamed:@"KKMedicalRecordTableViewCell" owner:nil options:nil].lastObject;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    cell.model = self.modelArrM[indexPath.row];
    
    return cell;
    
    
}



#pragma mark UITableViewDelegate
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
        return  100;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    

    KKmediaclModel *model = self.modelArrM[indexPath.row];
    _preSelectedModel.selected = NO;
    model.selected = YES ;
    
    [self reloadData];
    _preSelectedModel = model ;
}



@end
