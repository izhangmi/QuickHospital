//
//  ChooseDisease.m
//  快医
//
//  Created by bear on 16/5/12.
//  Copyright © 2016年 bear. All rights reserved.
//

#import "ChooseDisease.h"

@implementation ChooseDisease

/**
 *  初始化方法
 *
 *  @param dict 字典
 *
 *  @return 对象
 */

-(instancetype)initWithDict:(NSDictionary *)dict
{
    if (self = [super init]) {
        //使用KVC
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}



/**
 *  工厂方法
 *
 *  @param dict 数据字典
 *
 *  @return 对象
 */
+(instancetype)chooseDiseaseWithDict:(NSDictionary *)dict
{
    return [[self alloc]initWithDict:dict];
}

@end
