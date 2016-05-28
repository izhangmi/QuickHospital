//
//  THBookingDetailDisplayModel.h
//  快医
//
//  Created by litianhao on 16/5/11.
//  Copyright © 2016年 bear. All rights reserved.
//

#import <Foundation/Foundation.h>

@class THBookingDetailInfoModel ;

@interface THBookingDetailDisplayModel : NSObject


@property (nonatomic,copy) NSString *iconName;
@property (nonatomic,copy) NSString *userName;

@property (nonatomic,copy) NSString *doctorName;
@property (nonatomic,copy) NSString *doctorPost;
@property (nonatomic,copy) NSString *hospital;

@property (nonatomic,copy) NSString *diseaseName;
@property (nonatomic,copy) NSString *visitTime;

@property (nonatomic,strong) THBookingDetailInfoModel *bookInfo;

+ (instancetype)bookingDetailDisplayModelWithDict:(NSDictionary *)dict;

@end

