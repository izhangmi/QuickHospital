//
//  concernedDoctorModel.m
//  shoucang
//
//  Created by 朱宁MacPro on 16/5/11.
//  Copyright © 2016年 朱宁MacPro. All rights reserved.
//

#import "concernedDoctorModel.h"

@implementation concernedDoctorModel
+(instancetype)doctorModelWithDict:(NSDictionary *)dict{


    concernedDoctorModel *DoctorModel = [[concernedDoctorModel alloc]init];
    
  [DoctorModel setValuesForKeysWithDictionary:dict];
    
    return DoctorModel;

}
-(void)setValue:(id)value forUndefinedKey:(NSString *)key{

}
@end
