//
//  PayDetailsModel.m
//  支付明细
//
//  Created by 朱宁MacPro on 16/5/10.
//  Copyright © 2016年 朱宁MacPro. All rights reserved.
//

#import "PayDetailsModel.h"

@implementation PayDetailsModel
+(instancetype)PayDetailsModelWithDict:(NSDictionary *)dict{
    
    PayDetailsModel *model = [[PayDetailsModel alloc]init];
    
    [model setValuesForKeysWithDictionary:dict];
    
    
    
    return model;
    
}


-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
    
}

@end
