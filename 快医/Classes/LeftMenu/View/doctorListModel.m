//
//  doctorListModel.m
//  Doctor List
//
//  Created by 张少霞 on 16/5/10.
//  Copyright © 2016年 zsx. All rights reserved.
//

#import "doctorListModel.h"

@implementation doctorListModel

+(instancetype)notificationModelWithDict:(NSDictionary *)dict{
    
    doctorListModel *model = [[doctorListModel alloc]init];
    
    [model setValuesForKeysWithDictionary:dict];
    
    return model;
    
    
}

-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
}
@end
