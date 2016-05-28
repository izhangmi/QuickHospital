//
//  DoctorInfo.h
//  快医
//
//  Created by bear on 16/5/12.
//  Copyright © 2016年 bear. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <YYModel.h>

@interface DoctorInfo : NSObject


@property (nonatomic, assign) NSInteger banner;
@property (nonatomic, assign) NSInteger bannerFee;
@property (nonatomic, strong) NSObject * bannerFeeName;
@property (nonatomic, strong) NSString * departmentName;
@property (nonatomic, assign) NSInteger doctorGender;
@property (nonatomic, assign) NSInteger doctorId;
@property (nonatomic, strong) NSString * doctorName;
@property (nonatomic, strong) NSString * doctorPortrait;
@property (nonatomic, strong) NSString * doctorTitleName;
@property (nonatomic, strong) NSString * easymobId;
@property (nonatomic, assign) NSInteger flower;
@property (nonatomic, assign) NSInteger flowerFee;
@property (nonatomic, strong) NSObject * flowerFeeName;
@property (nonatomic, strong) NSString * hospitalName;
@property (nonatomic, assign) NSInteger isSaved;
@property (nonatomic, strong) NSObject * mentorContent;
@property (nonatomic, assign) NSInteger mentorId;
@property (nonatomic, assign) NSInteger operationCount;


@end
