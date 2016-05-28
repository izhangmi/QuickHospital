//
//  hospitalOfConcernModel.m
//  我的收藏
//
//  Created by 朱宁MacPro on 16/5/10.
//  Copyright © 2016年 朱宁MacPro. All rights reserved.
//

#import "hospitalOfConcernModel.h"

@implementation hospitalOfConcernModel

+(instancetype)hoispatalModelWithDict:(NSDictionary *)dict{

    hospitalOfConcernModel *hoispitalModel = [[hospitalOfConcernModel alloc]init];

    [hoispitalModel setValuesForKeysWithDictionary:dict];

    return hoispitalModel;

}
-(void)setValue:(id)value forUndefinedKey:(nonnull NSString *)key{



}


@end
