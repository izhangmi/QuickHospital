//
//  HospitalData.m
//  快医
//
//  Created by 付凯琪 on 16/5/10.
//  Copyright © 2016年 bear. All rights reserved.
//

#import "HospitalData.h"

@implementation HospitalData
+ (instancetype)hospitalDataWithDict:(NSDictionary *)dict{

    HospitalData *data = [[HospitalData alloc] init];
    
    [data setValuesForKeysWithDictionary:dict];
    return data;
}

//加载数据
+ (NSArray *)loadHospitalDataWithPlistName:(NSString *)plistname{

    NSString *path = [[NSBundle mainBundle]pathForResource:plistname ofType:nil];
    NSArray *dictArr = [NSArray arrayWithContentsOfFile:path];
    
    NSMutableArray *arrM = [NSMutableArray arrayWithCapacity:dictArr.count];
    
    [dictArr enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        HospitalData *data = [HospitalData hospitalDataWithDict:obj];
        [arrM addObject:data];
        
    }];
    return arrM.copy;

}
@end
