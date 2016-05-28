//
//  concernedDoctorModel.h
//  shoucang
//
//  Created by 朱宁MacPro on 16/5/11.
//  Copyright © 2016年 朱宁MacPro. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface concernedDoctorModel : NSObject
//标题


@property(nonatomic,strong)NSString *doctor_title_name;
@property (nonatomic, strong) NSString * doctor_portrait;
@property (nonatomic, strong) NSString * hospital_name;
@property (nonatomic, strong) NSString * doctor_name;
@property (nonatomic, strong) NSString * flower;
@property (nonatomic, strong) NSString * operation_count;
@property (nonatomic, strong) NSString * banner;


+(instancetype)doctorModelWithDict:(NSDictionary *)dict;



@end
