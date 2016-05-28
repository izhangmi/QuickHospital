//
//  MacthedDoctorCell.h
//  快医
//
//  Created by bear on 16/5/12.
//  Copyright © 2016年 bear. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MatchedDoctor.h"

@interface MacthedDoctorCell : UITableViewCell

@property (nonatomic, strong) MatchedDoctor *matchedDoctor;

+ (instancetype)cellWithTableView:(UITableView *)tableVeiw;
@end
