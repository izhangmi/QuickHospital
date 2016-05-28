//
//  THBookingDetailVC.h
//  快医
//
//  Created by litianhao on 16/5/11.
//  Copyright © 2016年 bear. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "doctorListModel.h"

@interface THBookingDetailVC : UIViewController

@property (nonatomic,strong) NSDictionary *displayInfo;
@property (nonatomic,strong) doctorListModel *modelToDisplay;

@end
