//
//  KKmediaclModel.m
//  快医
//
//  Created by 朱宁MacPro on 16/5/13.
//  Copyright © 2016年 bear. All rights reserved.
//

#import "KKmediaclModel.h"

@implementation KKmediaclModel
+(instancetype)KKmedicalModelWithDict:(NSDictionary *)dict{

    KKmediaclModel *model = [[KKmediaclModel alloc]init];
    
    [model setValuesForKeysWithDictionary:dict];
    
    
    
    return model;
    




}


@end
