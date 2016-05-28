//
//  THBuySeviceTV.m
//  快医
//
//  Created by litianhao on 16/5/13.
//  Copyright © 2016年 bear. All rights reserved.
//

#import "THBuySeviceTV.h"

#import "THBuySeviceCell.h"

#import "THBuySeviceModel.h"
#import "THBuySeviceHeaderView.h"

static NSString *THbuySeviceCell = @"THBuySevice";

@interface THBuySeviceTV ()<UITableViewDelegate , UITableViewDataSource>

@property (nonatomic,strong) NSArray *models;
@property (nonatomic,strong) THBuySeviceModel *preSelectedModel;

@end

@implementation THBuySeviceTV

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.delegate = self ;
        self.dataSource = self;
        UINib *nib = [UINib nibWithNibName:@"THBuySeviceCell" bundle:nil];
        [self registerNib:nib forCellReuseIdentifier:THbuySeviceCell];
        
        self.translatesAutoresizingMaskIntoConstraints = YES ;
        
        
        THBuySeviceHeaderView *buyView =  [[NSBundle mainBundle] loadNibNamed:@"THBuySeviceHeaderView" owner:nil options:nil].lastObject;

        
        self.tableHeaderView = buyView ;
        
        self.tableFooterView = [UIView new];
        
        self.separatorStyle = UITableViewCellSeparatorStyleNone;

    }
    return self ;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    THBuySeviceCell *cell = [tableView dequeueReusableCellWithIdentifier:THbuySeviceCell];
    cell.model = self.models[indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.models.count ;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    THBuySeviceModel *model = self.models[indexPath.row];
    self.preSelectedModel.isSelected = NO ;
    model.isSelected = YES ;
    
    [self reloadData];
    
    self.preSelectedModel = model ;
    self.hsaSelected = YES ;
}

- (NSArray *)models
{
    if (!_models) {
        NSArray *arr = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"buyService.plist" ofType:nil]];
        NSMutableArray *tempArr = [NSMutableArray arrayWithCapacity:arr.count];
        [arr enumerateObjectsUsingBlock:^(NSDictionary  *_Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            THBuySeviceModel *model = [THBuySeviceModel modelWithDict:obj] ;
            [tempArr addObject:model];
        }];
        _models = [tempArr copy];
    }
    return _models ;
}

@end
