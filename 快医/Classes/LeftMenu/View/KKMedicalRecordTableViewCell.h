//
//  KKMedicalRecordTableViewCell.h
//  快医
//
//  Created by 朱宁MacPro on 16/5/13.
//  Copyright © 2016年 bear. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KKmediaclModel.h"
@interface KKMedicalRecordTableViewCell : UITableViewCell


@property(nonatomic,strong)KKmediaclModel *model;
@property (weak, nonatomic) IBOutlet UIButton *selectBtn;


@end
