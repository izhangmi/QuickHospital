//
//  THBookingDetailInfoModel.h
//  快医
//
//  Created by litianhao on 16/5/11.
//  Copyright © 2016年 bear. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface THBookingDetailInfoModel : NSObject

@property (nonatomic,copy) NSString *homeHospital;
@property (nonatomic,copy) NSString *homeDepartment;
@property (nonatomic,copy) NSString *cost;
@property (nonatomic,copy) NSString *address;

+ (instancetype)bookDetailInfoModelWithDict:(NSDictionary *)dict;

@end
