//
//  HospitalHeaderView.h
//  快医
//
//  Created by 付凯琪 on 16/5/9.
//  Copyright © 2016年 bear. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HospitalHeaderView : UIView
@property (nonatomic, copy) NSString *ChoiceStr;
@property (nonatomic, copy) void(^tugBtnClick)(NSArray *listData);

@end
