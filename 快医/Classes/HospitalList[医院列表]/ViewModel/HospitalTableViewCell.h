//
//  HospitalTableViewCell.h
//  快医
//
//  Created by 付凯琪 on 16/5/9.
//  Copyright © 2016年 bear. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HospitalData.h"
#define kHospitalTableViewCell @"HospitalTableViewCell"
@interface HospitalTableViewCell : UITableViewCell

@property (nonatomic, weak) HospitalData *data;


+(instancetype)hospitalCellWithTableView:(UITableView *)tableView;

@end
