//
//  doctorConcernedTableViewCell.h
//  收藏03
//
//  Created by 朱宁MacPro on 16/5/11.
//  Copyright © 2016年 朱宁MacPro. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "concernedDoctorModel.h"
@interface doctorConcernedTableViewCell : UITableViewCell
@property(nonatomic,strong)concernedDoctorModel *doctorConcernedlModel;

+(instancetype)doctorCellWithTableView:(UITableView *)tableView;
@end
