//
//  hospitalOfConcernTableViewCell.h
//  我的收藏
//
//  Created by 朱宁MacPro on 16/5/10.
//  Copyright © 2016年 朱宁MacPro. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "hospitalOfConcernModel.h"
@interface hospitalOfConcernTableViewCell : UITableViewCell

@property(nonatomic,strong)hospitalOfConcernModel *hospitalModel;

+(instancetype)hoispitalCellWithTableView:(UITableView *)tableView;

@end
