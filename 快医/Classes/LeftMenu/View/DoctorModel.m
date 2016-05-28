//
//  DoctorModel.m
//  Doctor
//
//  Created by 张少霞 on 16/5/11.
//  Copyright © 2016年 zsx. All rights reserved.
//

#import "DoctorModel.h"

@implementation DoctorModel
+(instancetype)doctorModelWithDict:(NSDictionary *)dict{
    
    DoctorModel *model = [[DoctorModel alloc]init];
    
    [model setValuesForKeysWithDictionary:dict];
    
    
    return model;
    
    
}



-(void)setValue:(id)value forUndefinedKey:(NSString *)key{


}
@end
