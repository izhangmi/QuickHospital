//
//  HospitalTableView.h
//  快医
//
//  Created by 付凯琪 on 16/5/9.
//  Copyright © 2016年 bear. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HospitalData.h"
@interface HospitalTableView : UITableView


@property (nonatomic, copy) NSString *plistName;

#pragma mark - 增加属性,把数据字典传给控制器
@property (nonatomic, copy) void(^jumpToVc)(HospitalData *,NSArray *);

@end
