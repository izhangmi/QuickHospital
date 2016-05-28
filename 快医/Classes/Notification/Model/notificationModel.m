//
//  notificationModel.m
//  通知
//
//  Created by 张少霞 on 16/5/9.
//  Copyright © 2016年 zsx. All rights reserved.
//

#import "notificationModel.h"

@implementation notificationModel

+(instancetype)notificationModelWithDict:(NSDictionary *)dict{

    notificationModel *model = [[notificationModel alloc]init];
    
    [model setValuesForKeysWithDictionary:dict];
    
    return model;
    


}

-(void)setValue:(id)value forUndefinedKey:(NSString *)key{

}
@end
